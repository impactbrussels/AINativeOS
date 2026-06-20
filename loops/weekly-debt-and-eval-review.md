---
name: weekly-debt-and-eval-review
description: Use when a founder wants a weekly health loop on an agent-built system - runs the full eval suite, surfaces regressions CACE-aware, ranks agentic debt by interest, and drafts a CACE-safe paydown for the single highest-interest item behind the eval gate.
cadence: weekly
function: loop
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# Weekly Debt-and-Eval Review

In a learned system, changing anything changes everything, and the rot you cannot see compounds the
fastest. An eval drifts a point a week and nobody notices until the model is failing the case that
matters. A God Agent absorbs one more job and the next change becomes unauditable. This loop runs the
full eval suite once a week, catches the regression while it is one point and not ten, ranks the debt
by interest rate, and drafts a single safe paydown for the item that is quietly costing you the most.
One change, gated, not a big-bang rewrite.

Built on the loop-engineering framework: see [docs/LOOP-ENGINEERING.md](../docs/LOOP-ENGINEERING.md)
and [skills/design-a-loop/](../skills/design-a-loop/) for the underlying method.

## When to run

Weekly, on a fixed day, against the full eval suite and the whole repo. Daily is too noisy for a debt
ledger; monthly lets a regression hide for three weeks. Weekly is the cadence at which a one-point
eval slip is still a one-point eval slip.

## The 4-condition check

1. **The task repeats.** System health degrades continuously in an agent-built codebase. Reviewing it
   is a standing job, not a one-off cleanup.
2. **Automated verification gates the work.** The full eval suite is the gate. No paydown is drafted
   that does not pass it, and the regression hunt is itself an eval run.
3. **It is budget aware.** One paydown drafted per run, capped tokens and iterations. The loop ranks
   the whole ledger but only ever drafts the top item.
4. **The agent has senior tools.** It runs the real eval harness, reads the repo and the debt ledger,
   and drafts a paydown the way a staff engineer would: one isolated change, measured, not reasoned.

## Primitives

- **Automation / trigger:** a weekly scheduled run on a fixed day.
- **Skills it invokes:** [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md) to run
  the suite and read the rubric; [pay-down-agentic-debt](../skills/pay-down-agentic-debt/SKILL.md) to
  rank the ledger by interest times principal and pick the one CACE-safe change.
- **Connectors / MCP it touches:** the eval harness (read and run), the repo (read; write the drafted
  paydown only on a branch), the issue tracker (read, to map a regression to a reported symptom).
- **Worktree isolation:** yes, mandatory. The paydown is built in an isolated worktree so the
  one-change-then-measure discipline holds and the working tree stays clean if the gate fails.
- **Maker-checker split:** a maker sub-agent drafts the single paydown; a separate checker sub-agent
  runs the full eval suite against it and confirms nothing downstream regressed. The maker cannot
  declare its own change CACE-safe; only the eval can.

## State

The agent forgets last week's ledger; the repo keeps it. This loop reads and writes
`loops/state/debt-and-eval-STATE.md`. Resume: the ledger and the eval trend are the memory.

```markdown
# Debt and Eval State

## Eval trend (full suite)
| date | pass | total | delta | note |
|------|------|-------|-------|------|
| 2026-06-19 | 44 | 47 | -2 | regression on the dosage-rounding case (high stakes) |
| 2026-06-12 | 46 | 47 | 0 | |

## Regressions this run (CACE-aware)
- eval/dosage-rounding-07 went red. Likely entangled with last week's retrieval change 3 hops away.
  Flagged HOTL: touches a dose. Agent did NOT auto-draft a fix; human disposes.

## Debt ledger (ranked by interest x principal)
| item | category | interest | principal | rank |
|------|----------|----------|-----------|------|
| dropped feedback signal never stored | dead retrieval / broken loop | highest | low | 1 |
| God Agent doing classify + draft + score | God Agent | high | high | 2 |
| cosmetic lint in legacy module | cosmetic | lowest | low | leave |

## This run: drafted paydown (item 1, awaiting human)
- extract the feedback-write step; store the signal. Branch debt/feedback-write.
- gate: full eval PASS (no downstream regression). Status: DRAFTED, human disposes.
```

## The gate

The objective check is the **full eval suite**, run by the checker sub-agent on a clean context after
the paydown. A paydown is marked `DRAFTED` only if every eval the change could touch still passes
(CACE means you measure, you do not reason: the green diff is not proof, the green eval is). If the
suite itself does not exist, that is the highest-interest debt and the loop drafts nothing else until
it is built. The gate fails work; it is not a second optimist.

## Hard stop

Stop when any fire:

- One paydown has been drafted and gated this run (the loop drafts one item, never a batch).
- Token budget reached (suggested cap: 90,000 tokens per review).
- The top paydown fails the eval gate twice: revert, leave the item ranked, escalate, do not force it.
- The eval harness is broken or missing: stop, escalate it as debt item one, draft nothing else.

Write the ledger, the eval trend, and the stop reason to STATE.md.

## Human-on-the-loop

The loop drafts; a human disposes. No paydown merges without a human. Any regression on a high-stakes
eval is flagged, never auto-fixed. Mandatory human approval before any of the following:

- A change to a path carrying a dose, an allergen, a clinical or food-safety threshold, a payment, or
  access control. The loop surfaces the regression; a human, with a qualified professional where the
  domain demands it, decides the fix.
- Any change to the eval rubric itself (changing the test that protects you is a human decision).
- Any production deploy of a paydown.

This is not legal or medical advice. In hard mode, confirm thresholds with a qualified professional.

## Cost per accepted change

Watch the **cost per accepted paydown**: paydowns a human merges, divided by paydowns drafted. Below
about 50%, the ranking is wrong (you are drafting cosmetic debt, or debt the eval cannot actually
protect) or the gate is too weak to trust. Stop and fix the loop: re-rank by interest, or build the
missing eval, before drafting another change. A paydown loop that gets reverted half the time is
adding entanglement, not removing it.

## Example invocation

> Illustrative only. Exact syntax differs by platform. This is the shape, not a literal command.

```
/loop weekly
  /goal "Run the full evals, catch regressions CACE-aware, draft ONE safe paydown for the top debt."
  /steps
    1. Read loops/state/debt-and-eval-STATE.md to resume the ledger and eval trend.
    2. Run the full eval suite; record pass/total and the delta vs last week.
    3. Flag every regression. If it touches a dose/allergen/payment/auth path, mark HOTL, do not fix.
    4. Rank the debt ledger by interest x principal (pay-down-agentic-debt); pick the top item only.
    5. Maker sub-agent drafts ONE isolated CACE-safe change for that item in a worktree.
    6. Checker sub-agent runs the full eval suite against it; DRAFTED only if nothing regressed.
    7. Write the eval trend, ranked ledger, and the drafted paydown to STATE.md; merge nothing.
  /budget 90k tokens; one paydown per run; revert and escalate after 2 gate failures
  /human-disposes all merges, all rubric changes, all high-stakes regressions
```

---

*Part of [AI-Native OS](../README.md) loops. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
