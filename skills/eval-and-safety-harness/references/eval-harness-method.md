# The Eval Harness Method

A demo is not evidence. You picked the input, the moment, the clean case, and the model performed
because you stacked the deck. This is the full method behind the skill: the trust substrate, the
critic and judge pairing, the human-on-the-loop boundary, the deterministic fallback, and how to
build the eval set that gates a release. In hard mode the wrong answer does not stay on the screen;
it walks out into a person. Trust is engineered before you earn the right to act, never assumed after.

## The trust substrate

Turn "is it safe" into pass/fail checks a machine can enforce, each mapped to a pillar of the trust
substrate. If you cannot write five sharp binary checks, your safety bar is still a vibe.

| Check (binary) | What it enforces |
|----------------|------------------|
| Every claim cites a real, resolvable source. | No invented references reach a human. |
| Every number traces to a named input. | No figure is conjured mid-answer. |
| Uncertain claims are flagged uncertain. | Confidence is visible, not implied. |
| Confidence below threshold refuses rather than guesses. | The system stops on what it does not know. |
| Any claim touching a dose, allergen, or threshold routes to the deterministic path. | The dangerous answers never come from a guess. |

## Critic and judge pairing

One agent drafts. A second, running fresh with its own clean context and the written rubric, scores
that draft before anything reaches a human. An author cannot proofread their own typo, and a model
defending the context that produced its answer is the same blind spot amplified. Everything turns on
the rubric: "is this good?" passes everything; the sharp binary check catches the hallucinated
citation every run. Grading your own model with a soft prompt is theatre, not a gate.

## Human-on-the-loop and the deterministic fallback

Draw the line between what agents execute unattended and what a human must approve. Put
human-in-the-loop on the irreversible: a dose, a large trade, a product released to market. Put
human-on-the-loop on everything else, where the human reviews the exceptions queue, not every output.
The deterministic fallback is the non-AI path the system takes when confidence is low or the question
touches a threshold: a fixed rule, a conservative default, an honest "I cannot assess this,
escalating now". Not a retry. Not a better model. A model with no fallback does not stop on a case it
does not understand; it answers anyway, confidently, because that is what it was trained to do.

## How to design the eval set

Three kinds of case. A set with only the first kind passes everything and proves nothing.

| Case type | What it is | Why it is in the set |
|-----------|------------|----------------------|
| **Golden** | Known-good inputs with known-correct outputs. | Proves the happy path still works after a change. |
| **Adversarial** | Ambiguous prompts, manipulative phrasings, a plausible study that does not exist. | Proves the fallback fires when the input is built to break it. |
| **Regression** | Every case that once produced an unsafe output, frozen forever. | Proves a fixed failure stays fixed when the model version changes. |

## The release gate

Nothing ships until the harness passes. The gate is binary: every golden case correct, every
adversarial case caught by the fallback or the judge, every regression case still safe. One red case
holds the release. Re-run the whole set on every model version, because every new version fails in
new ways and the old eval is not the new model's eval.

## Worked harness: a supplement-interaction checker

A founder builds a tool that tells a user whether two supplements interact. The wrong answer is a
health event, so this is the feature where being wrong costs the most.

- **Rubric:** every interaction claim cites a real, resolvable source; every dosage figure traces to the user's input; an unknown pair returns "not assessed", never a guess; any pair involving a flagged high-risk compound routes to the deterministic path.
- **Critic and judge:** the generator drafts the interaction note; a separate judge, fresh context, hard-fails any note with an unresolvable citation or an unsupported figure before the user sees it.
- **Fallback:** for any high-risk compound, a fixed lookup table answers, not the model. Low confidence refuses and escalates to a named human.
- **Eval set:** golden cases of well-documented interactions; adversarial cases of invented compounds and lookalike names; regression cases of every pair that once produced an unsafe note.
- **Release gate:** ships only when all three case types pass. The deliverable from red-teaming is the list of cases where the model produced something unsafe and nothing caught it. Each one is a person you would have harmed in production.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| Grading your own model | The same model and context that drafted the answer also scores it, on a soft "is this good?". | Run a separate judge, fresh context, against the written binary rubric. |
| Happy-path-only evals | The eval set is all golden cases, so it passes every run and catches nothing. | Add adversarial and regression cases. A set that never fails is not testing anything. |
| No fallback | The system answers every input, including the ones it cannot assess. | Name the deterministic path for low confidence and for any threshold case. Confirm it fires before launch. |

## Copyable template

```
EVAL HARNESS: [PRODUCT]
Domain: [DOMAIN]   Hardest feature (most costly if wrong): [FEATURE]

RUBRIC (five binary checks, each mapped to a trust pillar)
  1. ______ -> pass/fail
  2. ______ -> pass/fail
  3. ______ -> pass/fail
  4. ______ -> pass/fail
  5. ______ -> pass/fail

CRITIC + JUDGE
  Generator drafts; separate judge (fresh context) hard-fails on the rubric pre-output.

DETERMINISTIC FALLBACK
  Triggers when: ______   The non-AI route: ______

HUMAN BOUNDARY
  Human-in-the-loop (irreversible): ______
  Human-on-the-loop (exceptions queue): ______

EVAL SET
  Golden: ______   Adversarial: ______   Regression: ______

RELEASE GATE
  Ships only when all three case types pass. Re-run on every model version.

NEXT ACTION: run design-the-mva to ship the smallest agent that proves the loop, harness wrapped around it.
```
