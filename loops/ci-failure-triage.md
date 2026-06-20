---
name: ci-failure-triage
description: Use when a founder wants the classic engineering loop that scans CI failures on a cadence, classifies each one (env, flake, real bug, dependency, infra), drafts fix PRs for the easy cases, escalates the rest, and never touches payments or auth without a human.
cadence: nightly
function: loop
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# CI Failure Triage

The oldest loop in agentic engineering, and the one that proves the pattern. CI goes red overnight
for five different reasons, and four of them are not bugs in your code: a runner ran out of memory, a
test is flaky, a dependency published a breaking minor, the infra had a wobble. A human triages that
queue by hand every morning and wastes the first hour of the day. A loop classifies it before you
arrive, drafts the boring fixes, and hands you only the failures that actually need judgement. This
is the canonical example from loop-engineering practice, and the discipline it teaches carries to
every other loop you build.

Built on the loop-engineering framework: see [docs/LOOP-ENGINEERING.md](../docs/LOOP-ENGINEERING.md)
and [skills/design-a-loop/](../skills/design-a-loop/) for the underlying method.

## When to run

Nightly, after the day's merges have run through CI, or on every red main build if your platform
supports event triggers. Nightly is the safe default: one queue, one report, no thrash.

## The 4-condition check

1. **The task repeats.** CI fails on a schedule as long as people commit. Triaging it is the textbook
   recurring task.
2. **Automated verification gates the work.** Every drafted fix has to make the failing job green
   without turning another job red. The CI run itself is the gate.
3. **It is budget aware.** A cap on failures triaged per run, a token ceiling, and a per-failure
   attempt limit. The loop classifies the whole queue but only drafts for the easy classes.
4. **The agent has senior tools.** It reads the full CI logs, the diff that triggered the failure, the
   dependency manifest, and the test history, the way a senior engineer reads a red build.

## Primitives

- **Automation / trigger:** a nightly scheduled run, or an on-red-build event trigger.
- **Skills it invokes:** [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md) to set
  the human-on-the-loop boundary for protected paths; [pay-down-agentic-debt](../skills/pay-down-agentic-debt/SKILL.md)
  when a failure is a recurring flake that traces to a ranked debt item, not a one-off.
- **Connectors / MCP it touches:** the CI provider (read logs, read status, read history), the repo
  (read; write a fix only on a branch and open a draft PR), the dependency registry (read versions).
- **Worktree isolation:** yes. Each drafted fix is built in its own worktree or branch and opened as a
  draft PR, so a speculative repair never lands on the working tree or main.
- **Maker-checker split:** a maker sub-agent drafts each fix PR; a separate checker sub-agent re-runs
  CI on the branch and confirms the target job is green and no other job regressed. The maker does not
  pass its own PR.

## The ci-triage classification table

A SKILL-style table the loop applies to every failure. Classify first; the class decides the lane.

| Class | What to look for | Loop action |
|-------|------------------|-------------|
| **env** | Runner OOM, missing secret, wrong runtime version, disk full | Draft a config fix (bump runner, pin runtime); never invent a secret. |
| **flake** | Passes on re-run, timing or order dependence, network blip | Re-run once; if green, log as flake and rank for a debt fix, do not "fix" blindly. |
| **real-bug** | A code change broke a genuine assertion; reproducible | Draft a fix PR in isolation; gate on full CI; mark DRAFTED for human review. |
| **dependency** | A bumped package broke the build; breaking minor or major | Draft a pin or a bounded upgrade; never auto-merge a major; flag for human. |
| **infra** | Provider outage, registry down, external service 5xx | Do not draft; record, wait, re-check next run; escalate if it persists. |
| **protected** | Failure is on a payments, auth, or access-control path | Never touch. Escalate to the human immediately. HOTL, no exception. |

The classifier's job is to get the lane right. A real-bug mislabelled as a flake ships a broken
build; a protected failure mislabelled as a real-bug is exactly the change a human must approve.

## State

The agent forgets the queue; the repo keeps the history. This loop reads and writes
`loops/state/ci-triage-STATE.md`. Resume: flake history and persisting infra issues live here.

```markdown
# CI Triage State

## Last run
- date: 2026-06-20 (nightly)
- failures triaged: 6 / 10 cap
- tokens used: 33,800 / 70,000 cap

## This run
| job | class | action | status | attempts |
|-----|-------|--------|--------|----------|
| build-linux | env | bump runner image, pin node 20 | DRAFTED (PR #88) | 1 |
| test-payments | protected | none | ESCALATED | 0 |
| e2e-checkout | flake | re-ran green; logged | WATCHING | 3 |
| unit-core | real-bug | fix off-by-one in retry | DRAFTED (PR #89) | 1 |
| deps-audit | dependency | pin lib to 4.2.1 (4.3 breaking) | DRAFTED (PR #90) | 1 |
| api-gateway | infra | provider 503; wait | RECHECK NEXT RUN | 0 |

## Flake watch (recurring; candidates for a debt fix)
- e2e-checkout flaked 3 of last 5 runs - rank for pay-down-agentic-debt

## Escalations for the human (top of report)
- test-payments red: PROTECTED path, not touched. Human disposes.
```

## The gate

The objective check is **CI itself**: the checker sub-agent re-runs the pipeline on the fix branch and
the fix is marked `DRAFTED` only if the previously failing job is green and no other job went red. A
flake that merely passed on re-run is not "fixed"; it is logged and watched. The gate is the same
pass or fail pipeline that failed in the first place, not a second agent asked whether the PR looks
reasonable.

## Hard stop

Stop when any fire:

- Failures-triaged cap reached (suggested cap: 10 per run).
- Token budget reached (suggested cap: 70,000 tokens per run).
- A single failure has failed its fix-and-gate cycle 3 times: stop, reclassify as an escalation, log.
- An `infra` failure persists across runs: escalate; do not keep drafting against an outage.
- CI cannot run at all: stop, escalate the pipeline itself, draft nothing.

Write the queue state and the stop reason to STATE.md.

## Human-on-the-loop

The loop drafts; a human disposes. Every fix lands as a draft PR a human merges. Never auto-merge.
Mandatory human approval, no exception, before any of the following:

- Anything on a **payments, auth, or access-control** path. The loop classifies it `protected` and
  escalates without touching it. This is the hard rule of CI triage.
- Any dependency **major** upgrade, or any change to the deploy or release pipeline.
- In hard mode, any failing job that gates a release carrying a dose, an allergen, a clinical or
  food-safety output, or a regulatory artefact.

The agent clears the boring four-fifths of the queue. You spend your judgement on the fifth that
needs it.

## Cost per accepted change

Watch the **cost per accepted PR**: draft PRs a human merges, divided by draft PRs opened. Below about
50%, the classifier is mislabelling failures (drafting fixes for flakes, or for bugs it does not
understand) and you are reviewing noise. Stop expanding the loop and tune the classification table or
tighten the gate. A triage loop that opens ten PRs to merge one is making your queue worse.

## Example invocation

> Illustrative only. Exact syntax differs by platform. This is the shape, not a literal command.

```
/loop nightly
  /goal "Triage the CI failure queue; draft fixes for the easy classes; escalate the rest."
  /steps
    1. Read loops/state/ci-triage-STATE.md to resume flake history and pending infra issues.
    2. Pull every failing job; read its full log and the triggering diff.
    3. Classify each with the ci-triage table: env | flake | real-bug | dependency | infra | protected.
    4. PROTECTED (payments/auth/access): escalate, do not touch.
    5. For env / real-bug / dependency (non-major), a maker sub-agent drafts a fix PR in a worktree.
    6. Checker sub-agent re-runs CI on the branch; DRAFTED only if the job is green and nothing else broke.
    7. Re-run flakes once; log, do not blind-fix. Record infra; recheck next run.
    8. Write the queue, classes, and escalations to STATE.md; merge nothing.
  /budget 70k tokens; 10 failures/run; escalate after 3 failed fix attempts on one job
  /human-disposes all merges; never auto-touch payments/auth or a dependency major
```

---

*Part of [AI-Native OS](../README.md) loops. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
