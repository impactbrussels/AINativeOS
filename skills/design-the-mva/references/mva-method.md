# Design the MVA: The Method

The full method for scoping a Minimum Viable Agent. The MVA is the smallest agent that proves the
intelligence loop closes on one real job. Not the smallest screen, not the cheapest build: the
smallest thing that lets a real person hand a real task to a machine and keep the result. Scope by
risk, not by excitement. The demo is not the product.

## The four moves expanded

| Move | What you decide | The test it must pass |
|------|-----------------|-----------------------|
| 1. Find the Goldilocks task | One task, high-volume and guideline-based and low-risk, all three. | If it fails one of the three, it is the wrong first task. |
| 2. Define the loop | Task in, agent acts, outcome out, human accepts or corrects, system records the choice. | Remove the model: if the loop still works, you scoped a feature. |
| 3. Name the one bet | Users in role R, on task T, keep the output without redoing it M percent of the time. | The bet must be able to come back no. |
| 4. Set the fallback floor | Retry N times, switch backup, drop to a fixed non-AI path, escalate to a named human. | Bounded in one sentence, no infinite loop. |

## The Goldilocks zone

Three filters, scored before you build. A task is in the zone only when all three pass.

| Filter | Pass | Fail |
|--------|------|------|
| Volume | Runs many times a day, throws off signal fast. | Rare event, you wait months to learn anything. |
| Checkable | A human verifies right or wrong at a glance. | No knowable answer, every output is an argument. |
| Risk | A wrong answer annoys someone. | A wrong answer harms someone or triggers a recall. |

Your highest-value task is usually your highest-risk one. Write it on the roadmap for later. Earn
trust on the boring task beside it first, because the first wrong answer on a high-risk job detonates
the trust the whole roadmap needs.

## Closed-loop-first scoping

Scope the loop before the surface. A loop that learns beats a feature that impresses. Ask: when this
agent runs once, what gets captured, and does the next run get measurably better because of it? If
nothing is recorded, you built a one-shot tool, not a flywheel. The human accept-or-correct step is
not optional polish: it is where the proprietary signal comes from.

## The self-healing fallback floor

A pilot user who hits a dead end twice goes back to doing the job by hand. You lose them on
reliability, not capability. The floor, in one bounded sentence: retry a set number of times, switch
to a backup model, then drop to a fixed deterministic answer and escalate to a named human. Cap the
retries. Recovery without a hard cap is an infinite loop wearing a nicer name.

## Worked MVA scope: an invoice-coding agent

A founder wants an AI bookkeeper for small firms. The exciting pitch is full autonomous accounts. The
right first agent is one task next to it.

- **Goldilocks task:** assign the expense category to each incoming invoice. High-volume (dozens
  daily), guideline-based (a chart of accounts gives the right answer), low-risk (a miscategory is an
  edit, not a filing). The exciting task, filing the return, is high-risk: roadmap, not MVA.
- **The loop:** invoice in, agent proposes a category, the bookkeeper accepts or recategorises, the
  system records the correction. Each correction sharpens the next proposal. That is the closed loop.
- **The one bet:** bookkeepers, coding invoices, keep the agent's category without changing it at
  least 80 percent of the time by week four. It can come back no.
- **The fallback floor:** retry twice on a model error, switch to a cheaper backup, then mark the
  invoice "needs human" and route it to the named bookkeeper. No infinite retry, no silent guess.

Surface: one queue with an Accept button. Thin on top, a real loop underneath.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| The feature pile | Ten panels, three integrations, a settings page, before one loop is proven. | Cut to one task. The unit of work is an experiment, not a feature. |
| No closed loop | The agent acts but nothing is captured; the human's correction vanishes. | Add the accept-or-correct record. If removing the AI leaves it working, you scoped a feature. |
| Shipping the demo | The happy-path demo becomes the product; the founder was the only steerer. | Hand it to a real user with no founder in the room. The demo proved nothing about trust. |
| Scoping by excitement | The MVA is the highest-value, highest-risk job because it is the impressive one. | Pick the safe task next door. The first wrong answer on the risky job costs the roadmap. |
| Unbounded fallback | "It just retries" with no cap, no deterministic floor, no named human. | Bound it: N retries, backup, fixed answer, escalate. Cap the loop. |

## Copyable template

```
MINIMUM VIABLE AGENT SCOPE: [PRODUCT]
ICP: [ICP]   Domain: [DOMAIN]   Date: [DATE]

GOLDILOCKS TASK: ____________________________________________
  Volume (runs often) ........ pass / fail  Evidence: __________
  Checkable (knowable right) .. pass / fail  Evidence: __________
  Risk (wrong = annoyance) .... pass / fail  Evidence: __________
  (All three must pass. If not, pick the safe task next door.)

THE LOOP (one sentence):
  Task in, agent does ____, human ____, system records ____.
  Remove-the-AI check: with the model gone, does the loop still work? yes = feature / no = agent

THE ONE BET (must be able to fail):
  Users in role [R], on task [T], keep the output without redoing it [M]% of the time by [WHEN].

FALLBACK FLOOR (one bounded sentence):
  Retry [N] times, switch to [backup], drop to [fixed non-AI answer], escalate to [named human].

NEXT ACTION: build the loop, hand it to one real user, no founder in the room.
```
