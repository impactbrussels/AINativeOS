# Loop Engineering: the full framework

A loop is a small system that finds the work, hands it to the agent, checks the result, records what
happened, and decides the next move on its own. You build it once; it prompts the agent from then on.
This file holds the test, the building blocks, the build order, a worked example with a sample state
file, the failure-mode table, the security checklist, and the credits. The framing is associated with
Boris Cherny (Claude Code) and Addy Osmani's loop-engineering writing; treat it as a method, not a
silver bullet.

## The maturity ladder

Manual prompting becomes simple loops, which become multi-agent with goals, which becomes fleet
orchestration. Each rung moves leverage from typing prompts to designing the system that prompts.
Climb only when the rung below runs reliably. A fleet built on a loop you have never watched succeed
is just a faster way to be wrong.

## The 4-condition test (build only if all four hold)

- [ ] **The task repeats.** Weekly or more, same shape. A one-off is a prompt, not a loop.
- [ ] **Verification is automated.** A test, type check, lint, or build can fail the work without you
  in the room. No machine grader means you are the gate, and a loop with a human gate saves nothing.
- [ ] **Your token budget absorbs the waste.** Loops re-read, retry, and explore. Price that in before
  you schedule it.
- [ ] **The agent has a senior engineer's tools.** Logs, a reproduction environment, and the ability to
  run the code it writes. A blind agent guesses and you clean up.

Miss one and the loop costs more than it returns. Fix the missing condition or do the task by hand.

## The 5 building blocks plus state

| Block | What it is | Use it for | Watch for |
|---|---|---|---|
| **Automation (heartbeat)** | A schedule, event, or trigger. `/loop` for a fixed cadence; `/goal` runs until a written condition holds, checked by a separate model. Codex exposes this as an Automations tab. | Starting each run without you | A `/goal` with no objective stop never ends |
| **Worktree isolation** | Git worktrees, one per agent | Parallel agents that must not collide on the same files | Forgotten worktrees pile up; clean them |
| **Skills** | Persistent project knowledge read every run | Giving the agent standing rules instead of re-explaining | A stale skill teaches the loop to be wrong |
| **Connectors and MCP** | Reach into GitHub, Linear or Jira, Slack, the error tracker | Finding the work and reporting the result | Every connector is a credential and an attack surface |
| **Sub-agents** | Separate the maker from the checker (the evaluator-optimizer pattern) | An independent gate that the maker cannot flatter | A checker sharing the maker's context just nods along |
| **State file (memory)** | `STATE.md`: the agent forgets, the repo remembers | Resume, not restart, across runs | Pair with a standing `VISION.md` or `AGENTS.md` reread each run, or constraints drift |

## The minimum viable loop and the build order

One automation, one skill, one state file, one gate. That is the whole thing. Build it in order:

1. Get **one manual run** reliable. Watch it succeed end to end.
2. Turn the run into a **skill**, the standing knowledge it rereads.
3. Wrap the skill in a **loop**, with a gate and a hard stop.
4. **Schedule** the heartbeat.

The metric that matters is **cost per accepted change**, not tokens burned or tasks attempted. Below
roughly half of changes accepted, the loop is losing: tighten the gate or kill it.

## Worked example: a CI-failure-triage loop

**Goal.** Nightly, find failing CI jobs, reproduce each, propose a fix, and open a pull request a human
reviews. Irreversible actions (merge, deploy) stay with the human.

| Spec field | Value |
|---|---|
| Trigger | Nightly schedule, plus a webhook on a red main build |
| Skill | `triage-ci.md`: how to read this repo's logs, reproduce, and scope a minimal fix |
| State file | `STATE.md` (below) |
| Gate | The full test suite green, plus a fresh sub-agent scoring the diff against a rubric (root cause addressed, no scope creep, no flake-masking) |
| Stop condition | Max 5 fix attempts per failure; 30-minute wall clock; token ceiling; stop when the suite is green and the checker passes |
| Escalation | After the cap, open a draft PR tagged `needs-human` and post the failure to Slack with a named owner |

The maker writes the fix; a separate checker sub-agent owns the gate so the maker cannot pass its own
work. Nothing merges or deploys unattended. The PR is the human-on-the-loop point.

### Sample STATE.md

```markdown
# Loop State: CI Triage
_Updated: 2026-06-20 02:14 UTC, run #41_

## Standing goal
Keep main green overnight. Propose fixes as PRs. Never merge or deploy. See VISION.md for constraints.

## Open failures
| Job | First seen | Attempts | Status | Notes |
|-----|-----------|----------|--------|-------|
| api-integration | run #39 | 2/5 | fix proposed, PR #812, needs-human | flaky DB fixture, not a real regression |
| web-e2e | run #41 | 1/5 | reproducing | timeout on checkout step |

## Resolved this week
- auth-unit (run #37): null-token guard, PR #804 merged by maintainer.

## Do not retry
- payments-e2e: touches a live charge path. Escalated to a human, loop must not act here.

## Budget
Tokens this run: 180k of 500k cap. Attempts remaining tonight: 3.
```

The state file is why run #41 resumes instead of restarting: it knows `api-integration` is a known
flake on attempt 2, and that `payments-e2e` is off-limits. The agent forgot all of this; the repo kept it.

## Failure modes and the fix for each

| Failure mode | What it looks like | Fix |
|---|---|---|
| **The Ralph Wiggum loop** | No real gate, soft completion, no hard stop; it fails quietly while spending | Add an objective gate and a hard stop (iterations, time, tokens) before scheduling |
| **Goal drift** | Long sessions lose constraints through lossy summarisation; the loop wanders | Reread a standing spec (`VISION.md`) every run; keep constraints out of the rolling context |
| **Self-preferential bias** | The maker grades its own homework kindly | A separate verifier sub-agent owns the gate, with its own context and rubric |
| **Agentic laziness** | "Done enough" with the real job unfinished | An objective `/goal` stop checked by a fresh model, not the maker's say-so |
| **Comprehension debt / cognitive surrender** | Diffs ship unread; nobody holds the system | Read the diffs, spot-check the gate, keep the loop off architecture, pair-design the hard parts |
| **The security tax** | Unreviewed generated code, skill-as-injection, leaked credentials, scope creep | The checklist below, on a schedule |

## Security checklist (an unattended loop is an unattended attack surface)

- [ ] Generated code is reviewed before it reaches a protected branch or production.
- [ ] Skills and fetched content are treated as prompt-injection vectors, not trusted input.
- [ ] No credentials in logs, prompts, or the state file.
- [ ] Permissions are least-privilege and re-audited on a schedule; watch for scope creep.
- [ ] Irreversible actions (merge, deploy, payment, filing) require a human; the loop proposes only.

## Hard mode

In food, health, and deeptech, never let a loop act unattended on anything irreversible or
safety-relevant: a dose, an allergen call, a regulatory filing, a payment. Human-on-the-loop is
mandatory and the gate must include the safety check, not just the tests. This is where the OS's HOTL
principle meets loop engineering. A green suite is not a safe release.

## Attribution and further reading

- The loop framing is associated with **Boris Cherny** (Claude Code) and **Addy Osmani**'s
  loop-engineering writing (addyosmani.com).
- The **Ralph / Ralph Wiggum loop** was named and documented by **Geoffrey Huntley**.
- The **maker-checker / evaluator-optimizer** pattern comes from **Anthropic**'s engineering writing on
  building effective agents.
- The debated productivity numbers around agentic coding are **contested**; if you cite them, attribute
  them and mark them as contested. Never assert them as fact.
