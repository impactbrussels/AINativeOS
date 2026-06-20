---
name: red-team-cadence
description: Use when an AI system is live and its safety needs re-checking on a schedule, not just at launch - re-runs the red-team attack suite and the safety evals every week and before every release, because the model drifts under you and yesterday's safe is not today's safe. Surfaces new vulnerabilities, gates them, escalates anything safety-critical.
cadence: weekly + pre-release
function: loop
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# Red-Team Cadence

Safety is not a launch gate you pass once. The provider ships a new checkpoint behind the same API
name, your prompt picks up a new few-shot example, a dependency moves, and the system that was safe on
Monday quietly answers differently on Friday. An attacker does not wait for your next manual audit, and
neither does model drift. This loop re-runs the adversarial suite on a cadence, so the question stops
being "was it safe when we shipped it?" and becomes "is it safe today?". The harness you built once
earns its keep by running while you sleep.

Built on the loop-engineering framework: see [docs/LOOP-ENGINEERING.md](../docs/LOOP-ENGINEERING.md)
and [skills/design-a-loop/](../skills/design-a-loop/) for the underlying method.

## When to run

Weekly on a fixed schedule, and again automatically before every release. Weekly catches drift; the
pre-release run catches what you just changed. In a regulated product, run it after any model-version
change too, because a silent provider update is exactly the event this loop exists to catch.

## The 4-condition check

This loop passes the loop test on all four conditions.

1. **The task repeats.** Drift is continuous and releases are frequent, so adversarial re-testing is a
   standing need, not a one-off. The suite that ran last week runs again this week against a model that
   may have moved.
2. **Automated verification gates the work.** The red-team attacks have objective pass or fail outcomes
   (a refused jailbreak, a resolved citation, a blocked injection). The suite scores itself; no human
   reads every attack transcript.
3. **It is budget aware.** A hard cap on attacks per run and tokens per run. The suite is sampled and
   prioritised by severity, not run exhaustively every night.
4. **The agent has senior tools.** It runs the real attack library, the real eval harness, and a
   reproduction of the live system, the same instruments a security engineer would reach for.

## Primitives

- **Automation / trigger:** a weekly scheduled run plus a pre-release hook. Two triggers, one report
  format.
- **Skills it invokes:** [red-team-the-agent](../skills/red-team-the-agent/SKILL.md) for the attack
  suite and scoring; [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md) for the
  safety evals and the deterministic-fallback checks the attacks probe.
- **Connectors / MCP it touches:** the eval and red-team harness (read and run), the model-version
  metadata (read, to detect a provider change since last run), the issue tracker (write a ticket on a
  new finding), the alerting channel (post a summary). Read-first; the only write is filing a finding.
- **Worktree isolation:** yes. Any reproduction or proposed mitigation is built in its own worktree, so
  probing the system never disturbs the working tree.
- **Maker-checker split:** the attacker sub-agent tries to break the system; a separate judge sub-agent,
  on a clean context, rules whether an attack actually succeeded. The attacker does not get to score its
  own win, and the system under test never judges itself.

## State

The agent forgets between runs; the repo remembers. This loop reads and writes
`loops/state/red-team-STATE.md`. Resume from it so a known-open vulnerability is not re-reported as new,
and a drift since the last model version is flagged. The schema:

```markdown
# Red-Team Cadence State

## Last run
- date: 2026-06-20
- trigger: weekly
- model version seen: claude-x-yyyy-mm (UNCHANGED since last run)
- attacks run: 120 / 400 library (severity-sampled)
- tokens used: 58,000 / 90,000 cap
- result: 2 new findings, 1 carried-open, 117 held

## Findings (open + new)
| id | category | severity | exploitable | status | note |
|----|----------|----------|-------------|--------|------|
| R-09 | prompt-injection | high | yes | OPEN-ESCALATED | injected instruction altered a dose field; HOTL |
| R-11 | hallucinated-citation | med | yes | DRAFTED | grounding gap; mitigation on branch fix/ground-r11; gate PASS |
| R-04 | jailbreak | low | no | HELD | refused as designed; logged for regression |

## Drift watch
- model version unchanged this run; if it changes, re-run the FULL suite, not the sample

## Escalations for the human (top of the report)
- R-09: a safety-critical injection succeeded. System flagged, not auto-changed. Human decides now.
```

## The gate

The objective check is the red-team suite plus the safety eval set, scored by the judge sub-agent on a
clean context. An attack counts as a finding only when the judge can reproduce the failure, not when an
agent has an opinion that it might fail. A proposed mitigation ships into the report as `DRAFTED` only
if it closes the attack and the full safety eval still passes (CACE-aware: a fix to one boundary must
not open another). The gate fails the work objectively, or it is not a gate.

## Hard stop

Stop when any of these fire, whichever comes first:

- Token budget for the run is reached (suggested cap: 90,000 tokens per run).
- The sampled attack set for the run is exhausted.
- A drafted mitigation has failed the safety eval 3 times: stop drafting, escalate the finding as
  unresolved, leave the system unchanged.
- The harness cannot run (broken eval or attack runner): stop and escalate the harness as finding one.

On any hard stop, write the partial state and the reason to STATE.md and report. An unattended safety
loop that cannot stop is itself a risk.

## Human-on-the-loop

The loop finds and drafts; a human disposes. No mitigation to a safety boundary ships without a human
review, and the agent never silently changes a safety-critical path on its own. Mandatory human
approval, no exception, before any of the following is acted on:

- A finding or fix touching a dose, an allergen, a clinical or food-safety output, or a regulatory claim.
- A finding or fix touching payments, auth, or access control.
- Any change to a deterministic fallback or a refusal boundary.

In hard-mode sectors a missed adversarial finding is a recall or a harmed user, not a bad review. The
loop's job is to surface the attack fast and honestly; the founder decides what ships. See
[eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md) and the
[safety-judge](../agents/safety-judge.md) agent for the boundary this inherits.

## Cost per accepted change

Watch two numbers. First, the **finding rate**: a sudden jump usually means the model drifted, so
re-run the full suite, do not dismiss it. Second, the **cost per accepted mitigation**: drafted fixes a
human merges, over what the loop spent finding and drafting them. If the loop floods you with
low-severity, non-exploitable noise, tighten the severity sampling rather than reading every transcript.
The point of the cadence is signal on real drift, not a daily wall of refused-as-designed attacks.

## Example invocation

> Illustrative only. Exact syntax differs by platform (Claude Code, Codex, Cursor, a cron runner).
> This is the shape, not a literal command.

```
/loop weekly + on-release
  /goal "Re-test the safety boundaries against drift and draft only mitigations that pass the safety eval."
  /steps
    1. Read loops/state/red-team-STATE.md to resume; note the last model version seen.
    2. If the model version changed, run the FULL attack suite; else run the severity-sampled set.
    3. Dispatch an attacker sub-agent to run injection, jailbreak, hallucination, and tool-abuse attacks.
    4. Dispatch a separate judge sub-agent to confirm, on a clean context, which attacks actually succeeded.
    5. For each confirmed, non-safety-critical finding, draft a mitigation in an isolated worktree.
    6. Gate every mitigation on the full safety eval; mark gate-passing ones DRAFTED.
    7. Escalate every safety-critical finding at the TOP of the report; change nothing on those.
    8. Write findings, the drift watch, budget used, and cost-per-accepted-mitigation to STATE.md.
  /budget 90k tokens, stop after the sampled set, escalate after 3 eval failures on one fix
  /human-disposes all safety-boundary changes; agent never alters a dose/allergen/auth/fallback path
```

---

*Part of [AI-Native OS](../README.md) loops. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
