# Capture Learning: The Method

The full knowledge-base append protocol. The OS gets smarter only when real outcomes are banked. A
skill that ran once and taught nothing wasted the run; the same mistake twice is the OS failing at its
one job. This method turns a thing that actually happened into a dated, sourced lesson the next founder
inherits. Append, never overwrite. Memory you can edit away is not memory.

## The four moves expanded

| Move | What you do | The test it must pass |
|------|-------------|-----------------------|
| 1. Capture the outcome | Write what happened, stripped of hope. | You can point to the run, the reply, or the metric. |
| 2. Write the dated lesson | Heading, Context, What happened, Lesson, Source. | The lesson is stated so the next founder avoids the mistake. |
| 3. Pick the file | Route by the shape of the learning, not the topic. | One of four files, chosen by the table below. |
| 4. Append | Add below existing entries, date it. | No older lesson is touched. |

## What is worth capturing

A real outcome only. Not an opinion, not a plan, not a demo. The four that qualify:

| Worth capturing | Not worth capturing |
|-----------------|----------------------|
| An eval result (the agent scored 0.71). | "The agent feels good." |
| A customer reply (asked for a refund; renewed without a nudge). | "Users will probably like this." |
| A failed or won launch (the post died; the cohort held). | A roadmap intention. |
| A Share-of-Model move (cited 6 times, rival 19). | A guess about a competitor. |

A guess dressed as a result poisons the file for everyone downstream. If you cannot point to the run,
the reply, or the metric, you are not done capturing.

## Which of the four KB files it lands in

Route by the shape of the learning, not its subject.

| The learning is... | Append to | Example |
|--------------------|-----------|---------|
| A durable rule that should govern every design | `PRINCIPLES.md` | "A demo is not evidence." |
| A concrete tactic, one move and its reason | `DOS-AND-DONTS.md` | "Do survey active users, not signups." |
| A dated outcome from one real run or case | `PLAYBOOK-LESSONS.md` | "2026-06-19: the May cohort held at 31%." |
| Evidence about what compounds or what trust you earned | `MOATS-LEDGER.md` | "The clause library breaks without our data." |

When unsure between two, ask whether it is a rule (PRINCIPLES), a move (DOS-AND-DONTS), a dated event
(PLAYBOOK-LESSONS), or proof of defensibility (MOATS-LEDGER). Most live, hot lessons land in
PLAYBOOK-LESSONS; the others harvest a durable rule out of several such lessons.

## The PLAYBOOK-LESSONS format

```
### YYYY-MM-DD: <one-line lesson>
**Context:** what was being attempted, in which stage.
**What happened:** the real outcome (eval result, customer reply, metric move, failure).
**Lesson:** the durable takeaway, stated so the next founder avoids the mistake.
**Source:** where this came from (run, case study, founder report).
```

## Worked KB entry: a PMF survey that came back under bar

A founder runs the 40% survey on a contract-review assistant. 300 active users, 31 percent "very
disappointed". The instinct is to bury it. The capture is the asset.

```
### 2026-06-20: A viral launch can hide sub-bar dependence; survey active users, not signups.

**Context:** Grow stage. Reading PMF on a contract-review assistant after a 12,000-signup launch.
**What happened:** Surveyed 300 active users with the Sean Ellis question. 31% answered "very
disappointed", under the 40% bar. Reorders needed a discount nudge; January cohort at 22% in May.
**Lesson:** A launch spike measures distribution, not fit. Run the 40% test on active users before
calling it PMF, and never raise on the signup total. The honest under-bar read is the signal.
**Source:** measure-ai-native-pmf run, founder report, 2026-06-20.
```

This is a dated outcome from one real run, so it goes to `PLAYBOOK-LESSONS.md`. The durable rule it
distils, "a launch spike is not fit", already lives in PRINCIPLES as "a demo is not evidence", so it is
not duplicated there.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| Overwriting | Editing an old lesson to match the new view, erasing the record of being wrong. | Append below. The history is the asset; the wrong call is itself the lesson. |
| Unsourced lessons | "We learned users prefer X" with no run, reply, or metric behind it. | Add the Source line. No source, not banked yet. |
| Capturing opinions, not outcomes | Logging a hope or a plan as if it happened. | Strip the hope. Write what happened, with the number or the quote. |
| Wrong file | A durable rule buried in a dated playbook entry where no one reads it as a rule. | Route by shape: rule to PRINCIPLES, move to DOS-AND-DONTS, event to PLAYBOOK-LESSONS, proof to MOATS-LEDGER. |
| Capturing nothing | A real result passes and no lesson is written. | The same mistake twice is the OS failing. Capture after every real outcome. |

## Copyable template

```
CAPTURE LEARNING: [one-line lesson]
Date: [YYYY-MM-DD]   Stage: [stage]   Domain: [DOMAIN]

OUTCOME (real, sourced, hope stripped): ____________________
  Can you point to the run / reply / metric? yes / no  (no = not done capturing)

DATED LESSON:
### [YYYY-MM-DD]: [one-line lesson]
**Context:** ____________________
**What happened:** ____________________
**Lesson:** [stated so the next founder avoids the mistake]
**Source:** ____________________

FILE (by shape, not topic):
  durable rule -> PRINCIPLES.md
  tactic (one move + reason) -> DOS-AND-DONTS.md
  dated outcome -> PLAYBOOK-LESSONS.md
  moat / trust evidence -> MOATS-LEDGER.md

APPEND below existing entries. Never overwrite an older lesson.
```
