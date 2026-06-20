---
name: daily-agent-standup
description: Use when a founder wants one daily loop that triages the state of an AI-native build before they sit down - scans open issues, failing evals, CI, and escalations, classifies them, drafts quick-win fixes in isolation, gates them, and surfaces the rest. The canonical first loop.
cadence: daily
function: loop
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# Daily Agent Standup

The first loop a founder schedules, and the one most builds never get round to. Every morning the
repo is in a slightly different state than you left it: an eval drifted, a dependency bumped, a CI
job went red overnight, a user filed an escalation at 2am. You can open seven tabs and reconstruct
that yourself, or you can run a loop that does the reconstruction before you arrive and hands you a
ranked list with the easy work already drafted. This loop is the standup an agent runs against your
system, not the one you sit through.

Built on the loop-engineering framework: see [docs/LOOP-ENGINEERING.md](../docs/LOOP-ENGINEERING.md)
and [skills/design-a-loop/](../skills/design-a-loop/) for the underlying method.

## When to run

Nightly or first thing each working morning, on a fixed schedule. Once per day. A standup that runs
hourly is not a standup; it is noise that trains you to ignore it.

## The 4-condition check

This loop passes the loop test on all four conditions.

1. **The task repeats.** Triage happens every single day a system is live. It is the definition of a
   recurring cadence.
2. **Automated verification gates the work.** Every drafted fix must pass the gate (the eval suite
   plus lint and build) before it is even proposed. The loop never hands you an unverified diff.
3. **It is budget aware.** A hard cap on tokens and iterations per run, and a per-fix attempt limit.
   The loop stops; it does not grind.
4. **The agent has senior tools.** It reads the issue tracker, the CI logs, the eval harness, and the
   repo through the same tools a senior engineer would use on a Monday morning, not a toy subset.

## Primitives

- **Automation / trigger:** a daily scheduled run (cron-style on a platform that supports it, or a
  manual kick on platforms that do not). One trigger, one report.
- **Skills it invokes:** [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md) to read
  and re-run the eval gate; [pay-down-agentic-debt](../skills/pay-down-agentic-debt/SKILL.md) when a
  recurring failure traces to a ranked debt item, not a one-off bug.
- **Connectors / MCP it touches:** the issue tracker (read), the CI provider (read logs and status),
  the eval harness (read and run), the repo (read, and write only on a branch). All read-first.
- **Worktree isolation:** yes. Each drafted fix is built in its own worktree or branch so a
  half-finished repair never touches the working tree you depend on.
- **Maker-checker split:** a maker sub-agent drafts each quick-win fix; a separate checker sub-agent,
  running fresh against the gate, decides whether it passes. The maker never scores its own work.

## State

The agent forgets between runs; the repo remembers. This loop reads and writes
`loops/state/daily-standup-STATE.md`. Resume from it, never restart cold. The schema:

```markdown
# Daily Standup State

## Last run
- date: 2026-06-20
- tokens used: 41,200 / 80,000 cap
- iterations: 3 / 6 cap
- gate: PASS (eval 47/47, lint clean, build green)

## Open items (carried + new)
| id | source | class | status | attempts | note |
|----|--------|-------|--------|----------|------|
| 142 | CI | flake | watching | 2 | retried green twice; not yet a fix |
| 156 | eval | real-regression | DRAFTED | 1 | fix on branch fix/eval-156; gate PASS; awaiting human |
| 161 | issue | quick-win | MERGED | 1 | typo in retry backoff; gate PASS; auto-eligible |
| 159 | escalation | HOTL | ESCALATED | 0 | user reports wrong figure; not touched; human disposes |

## Escalations for the human (top of the report)
- 159: agent returned an unsourced number to a user. Flagged, not fixed. Decide.

## Deferred (low interest, logged not actioned)
- cosmetic lint in legacy module; leave per pay-down-agentic-debt ranking
```

## The gate

The objective check is the existing eval suite plus lint and build, run by the checker sub-agent on a
clean context. A fix ships into the report as `DRAFTED` only if the gate is green and the eval set
the change touches still passes (CACE-aware: the diff is not the blast radius, the eval is). The gate
can and must fail the work. It is not a second optimistic agent asked "is this good?"; it is the same
pass or fail check that protects the parts the fix did not touch.

## Hard stop

Stop when any of these fire, whichever comes first:

- Token budget for the run is reached (suggested cap: 80,000 tokens per standup).
- Iteration cap is reached (suggested cap: 6 fix-and-gate cycles per run).
- A single item has failed the gate 3 times: stop drafting, reclassify it as an escalation, log it.
- The gate cannot run at all (harness broken): stop, escalate the harness itself as item one.

On any hard stop, write the partial state and the reason to STATE.md and report. A loop that cannot
stop is a runaway agent, not an assistant.

## Human-on-the-loop

The loop drafts; a human disposes. Nothing in the auto-eligible lane ships to production without a
human merge. Anything classed `HOTL` is never touched by the agent at all, only surfaced. Mandatory
human approval before any of the following reaches a user or production, no exception:

- A change touching payments, auth, or access control.
- An output carrying a dose, an allergen, a clinical or food-safety figure, or a regulatory filing.
- Any irreversible or production-deploy step.

In hard-mode sectors this boundary is the whole point. The agent prepares the decision; the founder
makes it. See [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md) for the
human-on-the-loop boundary this inherits.

## Cost per accepted change

Watch the **cost per accepted change**: how many drafted fixes a human actually merges, divided by
what the loop spent drafting them (tokens, and your review minutes). When acceptance drops below
about 50%, stop expanding the loop and fix it: the classifier is mislabelling, the gate is too weak,
or the quick-win lane is drafting work that was never quick. A loop that drafts ten to land one is
costing you more attention than it saves.

## Example invocation

> Illustrative only. Exact syntax differs by platform (Claude Code, Codex, Cursor, a cron runner).
> This is the shape, not a literal command.

```
/loop daily
  /goal "Triage the system state and draft only what passes the gate."
  /steps
    1. Read loops/state/daily-standup-STATE.md to resume; do not restart.
    2. Scan: open issues, failing evals, CI status, the escalation queue.
    3. Classify each item: quick-win | real-regression | flake | debt | HOTL.
    4. For each quick-win, dispatch a maker sub-agent in an isolated worktree to draft a fix.
    5. Dispatch a separate checker sub-agent to run the gate (eval + lint + build) on each draft.
    6. Mark gate-passing fixes DRAFTED; never auto-merge anything touching payments/auth/safety.
    7. Surface every HOTL item and every escalation at the TOP of the report.
    8. Write the new state, the budget used, and the cost-per-accepted-change to STATE.md.
  /budget 80k tokens, 6 iterations, stop and escalate after 3 gate failures on one item
  /human-disposes all merges; agent never ships payments/auth/dose/allergen/regulatory work
```

---

*Part of [AI-Native OS](../README.md) loops. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
