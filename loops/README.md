# Loops

A loop is a runnable recurring cadence the founder schedules: an agent that wakes on a timer, reads
the state of your system, does a bounded piece of work behind an objective gate, writes what it found
back to the repo, and surfaces what needs a human. Where a skill is one job and a flow chains skills
with checkpoints, a loop is the same job run on a schedule, with a hard budget and a stop condition,
so the system stays watched without you watching it. The full method, the four-condition test, the
gate, and the maker-checker pattern, lives in
[docs/LOOP-ENGINEERING.md](../docs/LOOP-ENGINEERING.md); design your own with
[skills/design-a-loop/](../skills/design-a-loop/).

## The loops

| Loop | Cadence | What it watches |
|------|---------|-----------------|
| [daily-agent-standup](daily-agent-standup.md) | daily | Open issues, failing evals, CI status, and the escalation queue. Classifies, drafts quick-win fixes behind the gate, surfaces the rest. The first loop to schedule. |
| [ci-failure-triage](ci-failure-triage.md) | nightly | The CI failure queue. Classifies each red job (env / flake / real bug / dependency / infra / protected), drafts fix PRs for the easy classes, escalates the rest. Never touches payments or auth. |
| [weekly-share-of-model-review](weekly-share-of-model-review.md) | weekly | Your Share of Model. Runs the locked buyer query set across the engines, computes citation share vs named competitors, diffs against last week, drafts GEO briefs for the gaps. |
| [weekly-debt-and-eval-review](weekly-debt-and-eval-review.md) | weekly | System health. Runs the full eval suite, catches regressions CACE-aware, ranks agentic debt by interest, drafts one CACE-safe paydown behind the eval gate. |
| [red-team-cadence](red-team-cadence.md) | weekly + pre-release | Safety against drift. Re-runs the adversarial attack suite and the safety evals, surfaces new vulnerabilities, drafts mitigations behind the safety gate, escalates anything safety-critical. |

## The universal safety rule

**Loops draft; humans dispose.** Every loop in this directory prepares work and surfaces decisions; a
human approves what ships. No loop merges to production, publishes content, or acts on an irreversible
path on its own. Human-on-the-loop is mandatory before anything irreversible or safety-relevant: a
payment, an auth or access-control change, a production deploy, or, in hard mode, a dose, an allergen,
a clinical or food-safety figure, or a regulatory filing. The agent finds the work and drafts the fix.
You make the call. See [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md) for the
boundary every loop inherits.

Every loop is also bounded by construction: a token and iteration cap, a hard stop condition, and an
objective gate (a test, a lint, a build, an eval) that can fail the work. A loop that cannot stop, or
that has no gate but a second optimistic agent, is a runaway, not an assistant.

## Start with one loop

Do not schedule five loops on day one. Begin with **[daily-agent-standup](daily-agent-standup.md)**,
the canonical first loop, and run it for a fortnight. Measure one number: the **cost per accepted
change**, the share of what the loop drafts that a human actually merges. While it sits above about
50%, the loop is earning its keep and you can add the next one. Below 50%, stop and fix the loop
before expanding: the classifier is mislabelling, the gate is too weak, or it is drafting work that
was never quick. One loop you trust beats four you have learned to ignore.

---

*Part of [AI-Native OS](../README.md) by Adam M. Adamek (Impact Brussels ASBL). Content CC-BY-4.0.*
