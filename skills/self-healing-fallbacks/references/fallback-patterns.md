# Self-Healing Fallbacks: the pattern catalogue

A self-healing fallback is the retry-and-reroute logic that keeps a loop alive when the primary model
fails: the call times out, the model is overloaded, the agent returns garbage, and instead of the
whole workflow face-planting, the system retries, switches to a backup, and keeps going. The hard rule
that separates healing from burning: every recovery is bounded, and on an irreversible path the system
drops to a fixed non-AI answer rather than guess fluently. This file holds the catalogue, the decision
table, the Goldilocks sizing, a worked example, the anti-patterns, and a copyable map.

## 1. The pattern catalogue

| Pattern | Fires when | Behaviour | Bound it needs |
|---|---|---|---|
| **Retry-with-backoff** | Transient failure: timeout, 429, overload, malformed output | Retry, widening the gap each time (1s, 2s, 4s) | Max N retries, total timeout |
| **Confidence-gated fallback** | Model self-reported or scored confidence below a threshold | Stop. Drop to the floor. Do not answer | The threshold number |
| **Deterministic floor** | High-risk path, any uncertainty at all | A fixed rule, a conservative default, an honest "I cannot assess this" | None: it is the bottom |
| **Cached-last-good** | Live call fails and a recent verified answer exists | Serve the last good answer, flagged stale | Max staleness age |
| **Circuit breaker** | A dependency fails repeatedly in a window | Stop calling it; fail fast to the floor until it recovers | Failure count + cool-down |
| **Human escalation** | The floor is reached on an irreversible path | Hand to a named human with the full context, do not act | Queue + a named owner |

These compose. A typical irreversible path is: retry-with-backoff (bounded), then circuit-breaker if
the dependency is down, then deterministic floor, then human escalation. Reversible paths can stop at
best-effort and a log.

## 2. The decision table: pick a pattern by risk and reversibility

Reversibility, not value, decides the fallback. Your highest-value job is often your highest-risk one;
that is exactly the path that needs the hardest floor, not the cleverest recovery.

| Path reversibility | Example | Primary pattern | On final failure |
|---|---|---|---|
| Fully reversible | A meme caption, a draft email, a suggestion | Retry-with-backoff | Best-effort answer, logged |
| Partly reversible | A stored record, an outbound message, a queued task | Retry + cached-last-good | Conservative default, flagged for review |
| Irreversible | A dose, an allergen call, a contamination threshold, a trade, a market release | Confidence-gated + deterministic floor | Refuse + human escalation, never a model guess |

The test for an irreversible path: if the model is wrong here, can a human undo it before harm? If no,
no model answer ships without a human on the loop. A hallucination in a meme app is a screenshot. The
same one on a label is a recall.

## 3. The Goldilocks-zone sizing: what to automate

Automate the high-volume, guideline-based, low-risk middle and put hard floors around the edges. The
fallback is where you decide which parts of a path the agent owns and which parts it must hand back.

| Zone | Automate the model? | Fallback posture |
|---|---|---|
| Too cold | High-volume but pure taste, no knowable right answer | The model cannot be measured; keep a human in the loop |
| **Goldilocks** | High-volume, guideline-based, low-risk | Automate; retry and best-effort fallback is enough |
| Too hot | High-value but irreversible: a dose, a threshold, a release | Deterministic floor + human; the agent proposes, never decides |

Size the automation to the zone, then let the fallback carry everything the zone cannot.

## 4. Worked example, end to end

**Workflow.** An allergen-flagging assistant for a food brand. A supplier sends an ingredient list;
the agent flags allergens and a human approves the label. Two paths: routine flagging (high-volume)
and the final dose/threshold call (irreversible).

**Path 1, routine flagging (partly reversible).**
- Trigger: model call times out or returns malformed JSON.
- Pattern: retry-with-backoff, 3 retries at 1s / 2s / 4s.
- If still failing: circuit-breaker trips after 5 failures in 60s, cache-last-good serves the most
  recent flag set, marked stale, and the item routes to the human review queue.
- Bound: 3 retries, 15s total, cached answer no older than 24h.

**Path 2, the allergen threshold call (irreversible).**
- Trigger: confidence below 0.9, OR the question touches a quantitative threshold.
- Pattern: confidence-gated fallback to a deterministic floor. The floor is a fixed rule: "any
  ingredient matching the regulated allergen list is flagged present; if the quantity is uncertain,
  default to the conservative side and escalate."
- Below threshold: the agent does not answer. It escalates to the named food-safety lead with the
  input and its uncertainty.
- Bound: zero model guesses on this path; one named human owns the queue.

**Result.** Path 1 self-heals and keeps the pilot user moving; path 2 never lets the model guess
fluently on a number that could put someone in hospital. Wrong is always loud: every fallback flags,
logs, or escalates.

## 5. Anti-patterns and fixes

| Anti-pattern | Why it fails | Fix |
|---|---|---|
| **Silent failure** | The system returns a confident, well-formed wrong answer and carries on; logs stay green, the recall starts weeks later | Make wrong loud: validate output, flag low confidence, escalate; never swallow the error |
| **Infinite retry** | Recovery that never gives up burns tokens in a circle until the bill arrives at 3am | Cap retries, set a wall-clock timeout and a budget ceiling before shipping |
| **Fluent guessing under low confidence** | The model answers anyway because that is what it was trained to do, on the one path where a guess harms | Confidence gate + deterministic floor on every irreversible path |
| **Soft fallback on a hard path** | "Retry the model" used where the answer touches a dose or threshold; a slow model still gives a wrong number | The floor must be non-AI: a fixed rule, a conservative default, a human |
| **No escalation owner** | The floor hands off to nobody; the item sits in a queue forever | Name a human owner per irreversible path; an escalation with no name is a silent failure |

## 6. Copyable fallback map template

```
# Fallback Map: [product], [date]

| Path | Reversibility | Trigger | Pattern | Confidence threshold | Floor behaviour | Escalation owner | Loop bounds |
|------|---------------|---------|---------|----------------------|-----------------|------------------|-------------|
| routine flagging | partly | timeout / bad JSON | retry-backoff → circuit-breaker → cache-last-good | n/a | last-good, flagged stale | review queue | 3 retries, 15s, cache <24h |
| threshold call | irreversible | confidence < 0.9 OR touches a number | confidence-gate → deterministic floor | 0.9 | fixed rule, conservative default | named food-safety lead | 0 model guesses |

Rules:
- Reversibility, not value, sets fallback hardness.
- Every loop is bounded: max retries + timeout + budget cap.
- Irreversible paths never ship a model guess; floor is non-AI + a named human.
- Every fallback flags, logs, or escalates. Wrong is always loud.
```
