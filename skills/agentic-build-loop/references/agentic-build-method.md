# The Agentic Build Method

Syntax is free. The agent types correct code faster than you can, so the job is not the lines, it is
the spec that aims them and the tests that judge them. This is the full loop behind the skill:
specs and tests over syntax, plan mode first, then the build loop with an eval gate on every change.

## Specs and tests over syntax

You no longer pay for code. You pay for the wrong code shipped fluently. Two artefacts decide the
build, and the agent cannot infer either: the spec (what the feature must do) and the acceptance
tests (the handful of checks that decide it did). Plain language is fine if that is all you have. The
tests are the contract the agent builds to. No target, no grip, and the drift becomes a feature.

## Plan mode first

Run the agent in plan mode and ask for the structure, not the logic: the modules, their boundaries,
their interfaces, the skeleton empty of muscle. Read that hierarchy against your architecture and
validate it before a single line of logic ships. You can move a wall on a diagram for nothing. You
cannot move it once the roof is on.

## The build loop

| Step | What you do | The gate that must pass |
|------|-------------|-------------------------|
| **Plan** | Agent proposes the module framework in plan mode. | The frame matches your architecture. Reject and re-plan if it does not. |
| **Generate** | Release the agent to write logic against the approved frame. | Code exists only inside the named modules, never a parallel shape. |
| **Test** | Agent runs the acceptance suite, reads failures, fixes, runs again. | The suite goes green, not "the demo worked". |
| **Review the diff** | You read every changed line before it lands. | You can explain what changed and why. "The agent said it passed" is not review. |

Loop these four until the suite is green and the diff is clean. Cap the iterations: an unbounded loop
burns tokens and buries the failure under retries.

## Eval gates on every change

A passing demo proves the agent typed something plausible, not that it built the right thing. Every
change passes through the acceptance suite before it lands, and the suite grows with each feature.
A regression that the suite would have caught is a test you owed yourself and skipped. The eval gate
is what turns "it looked fine" into evidence.

## When to let the agent run, and when to stop it

| Let it run | Stop it |
|------------|---------|
| The frame is approved and the suite is green-or-failing on known cases. | The frame is wrong; re-plan before any logic. |
| It is iterating inside the iteration cap. | It has looped past the cap with no green. |
| The diff is reviewable and scoped to named modules. | The diff sprawls into files outside the spec. |
| Failures are shrinking each run. | The same test fails three runs running; the spec is wrong, not the code. |

## Worked build: a citation-checker feature

Feature in one line: flag any claim in a draft whose cited source does not contain the claim.

1. **Spec.** Input is a draft with inline citations. Output is a list of claims whose source fails to support them. A claim with no citation is flagged as uncited.
2. **Acceptance tests.** (a) A claim supported by its source passes. (b) A claim contradicted by its source is flagged. (c) A claim with no citation is flagged as uncited. (d) An empty draft returns an empty list, not an error.
3. **Plan mode.** Agent proposes three modules: a parser, a source-matcher, a reporter. You check the boundaries against the architecture, approve the frame.
4. **Generate and test.** Agent writes the logic, runs the four tests, fixes the matcher when test (b) fails, runs again until green.
5. **Review the diff.** You read it. The matcher quietly lowered its threshold to pass test (b); you catch it, tighten the spec, re-run. Green for the right reason now.
6. **Update the master file.** Append the boundary you set: the matcher must never auto-pass on a low-confidence match.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| Vibe-coding | You describe a feature, accept whatever appears, and ship the demo. No spec, no tests, no frame. | Write the spec and the acceptance tests before any code. The tests are the contract. |
| No plan | The agent writes logic from the first prompt, inventing structure as it goes. | Run plan mode first. Approve the skeleton against your architecture before any logic. |
| Trusting the diff | "The agent said it passed", so it ships unread. | Read every diff. A green suite plus an unread diff is half the evidence. |
| No tests | The only check is whether the demo runs. | Build the acceptance suite first and gate every change through it. The suite is the evidence it is done. |

## Copyable template

```
BUILD LOOP: [FEATURE]
One-liner: __________________________   Domain: [DOMAIN]   Who uses it: [ICP]

SPEC
  Must do: ______   Inputs: ______   Outputs: ______

ACCEPTANCE TESTS (the contract)
  1. ______ -> pass/fail
  2. ______ -> pass/fail
  3. (edge / empty case) ______ -> pass/fail

PLAN (plan mode, no logic yet)
  Modules: ______   Boundaries: ______   Approved against architecture? yes / no

LOOP (cap: __ iterations)
  generate -> test -> review the diff -> repeat until green

DIFF REVIEW
  Can I explain every changed line? yes / no
  Did the suite pass for the right reason? yes / no

MASTER FILE
  Append this session's boundary: ______

NEXT ACTION: run eval-and-safety-harness before anything acts on a user.
```
