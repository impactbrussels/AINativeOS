# Gateway Design: The Router Pattern, the Schema, and the Guardrail Catalogue

The deep framework behind `gateway-agent-ops`. Source: Handbook
[Chapter 13, AI-Native Ops](../../../handbook/13-ai-native-ops.md). Read this once, then work from
the tables.

## 1. The router pattern, stated plainly

A gateway agent is the receptionist, not the surgeon. It receives every incoming request, reads it,
decides which narrow specialist should handle it, hands off, and returns the result. It holds no deep
expertise of its own. Behind it sits a roster of specialists, each with a short prompt, a small
toolset, and a clean context window.

Why this shape and not one big agent:

| Property | God Agent (one big prompt) | Gateway + specialists |
|----------|---------------------------|-----------------------|
| Debugging | Touch anything, something unrelated breaks | Debug one narrow agent at a time |
| Adding capability | Bloat the mega-prompt further | Add a specialist; gateway routes to it |
| Context per call | Every tool and rule loaded every time | Only the specialist's small toolset loads |
| Blast radius of a change | The whole system | One specialist |
| Auditability | Routing logic tangled through prose | One auditable place to log, authorise, rate-limit |

The single rule that protects the whole pattern: **the gateway stays dumb**. Its only output is a
routing decision. The moment it carries domain logic ("if the refund is over 50 euro, then..."), you
have rebuilt the God Agent with extra steps. Domain logic lives in the specialist, never the router.

### Route vs pipeline (do not confuse them)

- A **gateway** routes *one* request to the *right* specialist (one-shot classification).
- A **pipeline** runs *one* task *through* a fixed sequence of specialists (research -> draft ->
  check -> format).

Many ops systems use both: the gateway picks the pipeline, the pipeline runs the stations. Keep the
two shapes named separately or the design blurs.

## 2. Designing the classification schema

The gateway emits one structured verdict per request. Nothing more.

```json
{
  "class": "compliance_check",
  "specialist": "compliance-checker",
  "confidence": 0.92,
  "reason": "Request asks whether a draft claim meets the labelling rulebook.",
  "irreversible": false
}
```

Schema design rules:

| Rule | Why it matters |
|------|----------------|
| One class per request | If a request needs two specialists, it is two requests; split it upstream |
| Confidence is mandatory | It drives the route / escalate decision; a router with no confidence cannot escalate |
| `reason` is a short sentence | Makes the routing trace readable when a misroute happens |
| `irreversible` flag | Forces the draft-and-sign path for filings, payments, sends |
| Closed class list | An open-ended class set means the schema drifts; enumerate the classes and add new ones deliberately |

How to derive the class list: list every request the inbox *actually* receives over a real week, then
collapse near-duplicates until each class maps to exactly one specialist a narrow agent could own.
Resist inventing classes for requests you have never seen.

## 3. The route / escalate / refuse decision

Every verdict resolves to one of four dispositions. Decide the threshold before going live.

| Condition | Disposition | Note |
|-----------|-------------|------|
| Confidence high, specialist exists, action reversible | **Route** | The normal path |
| Confidence low, OR no specialist fits the class | **Escalate** | A human picks up; do not guess fluently |
| Action irreversible (filing, payment, outbound send, data delete) | **Route to draft, then escalate for signature** | Specialist assembles, human signs |
| Out of scope, unsafe, or an injection attempt | **Refuse** | Log it, surface it, do not act |

The discipline: a self-regulating loop earns autonomy on the boring, reversible work and hands the
irreversible calls back to a person, every time. When the gateway is uncertain, it stops and surfaces;
it does not pick the closest specialist and hope.

## 4. The guardrail catalogue

Every specialist ships wrapped in guardrails. These are circuit breakers, not polish. An agent in a
loop has no built-in fatigue: if the state never resolves the way it expects, it tries again, and
again, and each attempt costs a call. That is the four-figure weekend bill.

| Guardrail | What it is | What it stops | Default to set |
|-----------|-----------|---------------|----------------|
| Max-iteration cap | Hard limit on tool-call cycles per task | The agent retrying the same failed step forever | A low integer; raise only with evidence |
| Budget ceiling | A per-task spend cap in tokens or currency | The meter spinning while you sleep | The cost of one good run, plus headroom |
| Wall-clock timeout | A hard time limit per task | A subtly impossible goal running all night | Minutes, not hours, for boring-tail work |
| Loop detection | Notices "I have tried this exact thing three times" | Two agents handing a task back and forth | Trip after a small repeat count |
| Human escalation point | A fixed handoff to a person | An irreversible call made with no signature | Set before the specialist goes live |
| Circuit breaker | Trips the whole specialist offline after repeated failures | A broken tool taking the inbox down with it | Trip after N consecutive failures |

The non-negotiable line: **no specialist goes live without a budget cap and an iteration limit**. Full
stop. An agent that can spend money in a loop without a ceiling is a liability you have not been billed
for yet.

## 5. When to route, escalate, or refuse: the deeper test

- **Route** when the request is reversible, in-scope, and confidently classed. The cost of a wrong
  route here is an awkward edit, not a recall.
- **Escalate** when confidence is low, no specialist fits, or the action is irreversible. Escalation is
  cheap; a wrong irreversible action is not.
- **Refuse** when the request is out of scope, unsafe, or carries smuggled instructions (an injection
  riding in on data). Refusing and logging beats acting and apologising.

In a sensitive domain (health, food safety, finance, anything irreversible) the setpoint always
includes a deterministic stop. A hallucination in a status report is an awkward edit. The same
hallucination on a label, a dossier, or a regulatory filing is a recall or a rejected application.

## 6. Worked example: routing an operations inbox

A small nonprofit runs grant work, compliance, and content through one overloaded assistant. It drifts
and bills surprises. Decompose it.

**Step 1, request classes (from one real week's inbox):**

| Class | Trigger phrase in the inbox | One-job specialist | Toolset |
|-------|-----------------------------|--------------------|---------|
| `summarise_thread` | "What did we decide on X?" | Summariser | read-only retrieval |
| `draft_grant_section` | "Draft the impact annex for call Y" | Grant-drafter | retrieval + section template |
| `compliance_check` | "Does this claim pass the rulebook?" | Compliance-checker | rulebook lookup |
| `schedule_meeting` | "Set up the kickoff with the three leads" | Scheduler | calendar write |
| `unknown` | anything that fits none of the above | (none) | escalate to human |

**Step 2, the gateway verdict for "Draft the impact annex for call Y and submit it":**

```json
{
  "class": "draft_grant_section",
  "specialist": "grant-drafter",
  "confidence": 0.95,
  "reason": "Request to draft a grant annex section.",
  "irreversible": true
}
```

The `irreversible: true` flag (the request says *submit*) forces the draft-and-sign path: the
grant-drafter assembles the annex; a human signs before submission. The router does not submit.

**Step 3, guardrails on the grant-drafter:**

| Guardrail | Value |
|-----------|-------|
| Max iterations | 6 tool-call cycles |
| Budget ceiling | the cost of one full draft + 50% headroom |
| Timeout | 4 minutes |
| Loop detection | trip after the same retrieval query 3 times |
| Escalation point | human signs before submission; always |

**Step 4, the disposition trace, end to end:**

1. Request arrives -> gateway classifies as `draft_grant_section`, `irreversible: true`.
2. Routes to grant-drafter (draft only).
3. Grant-drafter assembles the annex within its budget and iteration caps.
4. Because `irreversible: true`, it stops at the signature gate and escalates.
5. Human reviews, signs, submits. The system never submitted on its own.

If the grant-drafter had hit its iteration cap mid-draft, it would have stopped and surfaced the
partial work, not spun the meter to completion.

## 7. Anti-patterns and the fix

| Anti-pattern | What it looks like | The fix |
|--------------|--------------------|---------|
| **The God Agent** | One 4000-word prompt doing every job; nobody dares edit it | Split into specialists behind a dumb gateway; one prompt per job |
| **Smart gateway** | The router grows business rules ("if refund > 50...") | Move every rule into a specialist; the gateway only emits a route |
| **No budget cap** | A specialist can call tools in a loop with no ceiling | Add a per-task budget ceiling before it ships; non-negotiable |
| **Silent infinite loop** | An agent retries a dead endpoint all weekend; no alert fires | Add max-iteration cap, timeout, loop detection, and an alert on trip |
| **Confident misroute** | Low-confidence requests forced to the nearest specialist | Escalate on low confidence; do not guess fluently |
| **Irreversible auto-action** | The agent files or pays without a human | Flag irreversible actions in the schema; draft-and-sign always |
| **Open class list** | New request types silently land in the wrong class | Enumerate classes; add new ones deliberately, with a test |

## 8. Copyable template

```markdown
# Gateway Ops Design: [DOMAIN]

## Routing map
| Request class | One-job specialist | Toolset | Reversible? |
|---------------|--------------------|---------|-------------|
|               |                    |         |             |

## Classification schema (gateway output)
{ "class": "", "specialist": "", "confidence": 0.0, "reason": "", "irreversible": false }

## Disposition rule
- Route when:        [high confidence + specialist exists + reversible]
- Escalate when:     [low confidence OR no specialist fits]
- Draft-and-sign when:[action is irreversible]
- Refuse when:       [out of scope / unsafe / injection]

## Guardrails (per specialist)
| Specialist | Max iterations | Budget ceiling | Timeout | Loop detection | Escalation point |
|------------|----------------|----------------|---------|----------------|------------------|
|            |                |                |         |                |                  |

## First specialist to build (ranked by weekly time eaten)
- Task: ______  Hours/week eaten: ______  Why first: ______
```

Build the first specialist with its guardrails, behind the gateway. Add the rest one at a time.
