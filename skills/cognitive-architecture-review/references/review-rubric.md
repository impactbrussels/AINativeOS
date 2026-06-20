# Cognitive Architecture Review: The Rubric

The full scored audit. Grade an existing or planned AI system against the four pillars and the one
closed loop, find the weakest link, and decide whether it survives the Remove-the-AI test. Score the
system as it is built, never as it is described. A pillar you can only point to on a slide is a zero.

## The scoring scale

Grade each pillar 0 to 3.

| Score | Name | Meaning |
|-------|------|---------|
| 0 | Absent | The pillar does not exist in the running system. |
| 1 | Bolt-on | Present but added late, decorative, or unintegrated; the system would run without it. |
| 2 | Present | Designed in, works on the happy path, but thin under load. |
| 3 | Load-bearing | Designed first, hard to remove, and the system breaks without it. |

A healthy AI-native system scores 2 or 3 on every pillar and has a live closed loop. One pillar at 0
or 1 is the weakest link, and the weakest link sets the ceiling for the whole system.

## The per-pillar rubric

### Brain (the model that reasons)

- **What good looks like:** the right model for each job, not the most expensive on every call. A
  named, cheaper fallback for bulk work and for when the frontier model is slow, down, or doubts
  itself. An eval suite that catches regressions before they ship.
- **Red flags:** one frontier model on every request regardless of difficulty; no fallback path; no
  eval, so "we improved the prompt" is an act of faith; model choice never written down.

### Memory (what the system knows that the Brain does not)

- **What good looks like:** retrieval grounding answers in proprietary or domain data; a vector store
  or index; a persistent master file the system reads at the start of every session.
- **Red flags:** "memory" is just the context window, so everything is forgotten when the session
  clears; retrieval was added after launch as a patch; no master file, so each session reinvents the
  system from a blank page.

### Planning (how it decides its moves, in order)

- **What good looks like:** an explicit plan-then-act pattern; a visible order of operations; a human
  approval gate before anything irreversible or high-stakes.
- **Red flags:** one mega-prompt does retrieval, reasoning, and acting in a single undifferentiated
  step; no plan mode; no human checkpoint on the dangerous moves.

### Tools (how it reaches the world)

- **What good looks like:** each tool call has a blast radius you can say out loud; irreversible
  actions (send, pay, publish, delete) are gated; failures degrade to a safe path.
- **Red flags:** tools that write, pay, or delete with no guardrail; no deterministic fallback when a
  call fails; the agent can take an irreversible action unsupervised.

## The closed-loop diagnostic

Pillars can all pass and the system can still be a wrapper, because the moat is the loop, not the
pillars. Run this diagnostic separately and let it carry the most weight.

1. Name the one sentence: "When a customer uses the product, ____ gets captured, which makes ____
   measurably better next month."
2. Trace the return arrow: use to captured data to a sharper product. If any link is missing, the
   loop is not closed.
3. Grade it: **present** (live and capturing), **weak** (designed but capturing nothing yet), or
   **absent** (no return arrow exists).

An absent loop is the headline finding, whatever the pillar scores. No loop, no flywheel, no moat.

## The severity-by-effort grid

Place each finding on the grid, then fix top-left first.

| | Low effort | High effort |
|---|---|---|
| **High severity** | Do first: the load-bearing pillar scoring 0 or 1, the absent closed loop, the ungated irreversible tool. | Do second, and start now: re-platforming memory, building the data-capture loop. |
| **Low severity** | Quick wins: write down the model choice, add the cheaper fallback. | Defer: nice-to-have refinements that do not change the verdict. |

A missing closed loop is always high-severity, even when it is high-effort. It is the only finding
that decides whether you have a company.

## Worked audit: a "smart" support assistant

A founder shows a support bot. It answers customer tickets by sending each one to a frontier model
with a long prompt, then posts the reply. The demo is clean.

| Pillar | Score | Evidence |
|--------|-------|----------|
| Brain | 1 | One frontier model on every ticket, no fallback, no eval suite. |
| Memory | 0 | No retrieval and no persistence. Each ticket is answered from the prompt alone; yesterday's resolutions are forgotten. |
| Planning | 1 | A single prompt reasons and acts at once. No plan step, no human gate before it posts. |
| Tools | 1 | It posts replies straight to the customer with no guardrail on the irreversible send. |

**Closed loop:** absent. Resolved tickets, agent corrections, and customer satisfaction are thrown
away. Nothing accrues, so next month's bot is no smarter than this month's.

**Weakest link:** Memory at 0, with Planning and Tools close behind.

**Remove-the-AI test:** delete the model and you have an empty inbox. It does collapse without
intelligence, so it is not a feature. But because nothing compounds, it is an **AI-native-shaped
wrapper**: it needs the AI, yet it builds no moat. The verdict is wrapper until the loop exists.

**Fix list (severity by effort):**
1. High severity, low effort: capture every resolved ticket and every human correction into a store. This starts the loop.
2. High severity, low effort: gate the customer-facing send behind a human-on-the-loop for high-risk tickets.
3. High severity, high effort: add retrieval over past resolutions and product docs so answers are grounded, not improvised. This moves Memory from 0 toward 3.
4. Low severity, low effort: add a cheaper model for simple tickets and an eval suite, lifting Brain.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| The God Agent | One agent does Brain, Memory, Planning, and Tools in a single undifferentiated step. Scores low on every pillar because nothing is designed; it is improvised each run. | Split the job. Give Planning its own step, Memory its own store, Tools their own gated calls. |
| Prompt-as-architecture | The "architecture" is one very long prompt. There is no system to audit, only wording to tweak. | Move structure out of the prompt and into the System Inventory: pillars, stores, and gates as real components. |
| Bolt-on memory | Retrieval and persistence were added after launch as a patch, so they sit beside the system, not inside it. Scores 1, not 3. | Re-pour the floor. Make retrieval and the master file something the system reads first, every session, not a late add. |
| Loop-last | Every pillar is solid, but the data-capture loop was deferred to "version two". The product cannot compound. | Move the loop to the first build. Decide today what signal each interaction must leave behind. |

## Copyable template

```
COGNITIVE ARCHITECTURE REVIEW: [PRODUCT]
Domain: [DOMAIN]   Reviewer: [NAME]   Date: [DATE]

PILLAR SCORES (0 absent / 1 bolt-on / 2 present / 3 load-bearing)
- Brain ....... [ ]  Evidence: __________________________________
- Memory ...... [ ]  Evidence: __________________________________
- Planning .... [ ]  Evidence: __________________________________
- Tools ....... [ ]  Evidence: __________________________________

CLOSED LOOP: present / weak / absent
  One sentence: When a customer uses it, ____ is captured, making ____ better next month.

WEAKEST LINK: __________________  (lowest load-bearing pillar)

REMOVE-THE-AI VERDICT: AI-native / wrapper
  Strip every model call. What remains of value? __________________

FIX LIST (top = highest severity, lowest effort)
1. ______________________________  [sev: H/L | effort: H/L]
2. ______________________________  [sev: H/L | effort: H/L]
3. ______________________________  [sev: H/L | effort: H/L]

NEXT ACTION: ______________________________
```
