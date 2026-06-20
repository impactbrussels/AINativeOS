# Loop Engineering

> The leverage has moved from typing the prompt to designing the system that prompts. The scarce skill
> is no longer wording a request well; it is building the loop that finds work, checks it, and decides
> the next move without you in the chair. Build one only where the work repeats and the check is hard.

## What a loop is, and why the leverage moved

A loop is a small system that finds the work, hands it to the agent, checks the result, records what
happened, and decides the next move on its own. You design it once. From then on, it prompts the agent.

For two years the skilled move was a sharp prompt. You sat in the loop, read each output, and steered
the next turn by hand. That still works, and it does not scale: your attention is the bottleneck, and
attention does not fan out. A loop removes you from the inner cycle. The agent gets its instruction
from a system you wrote, not from you typing in real time. So the craft shifts up a level. You are no
longer the operator of the agent; you are the engineer of the thing that operates it.

That is genuine leverage, and it is a genuine bill. A loop with no gate does not stop being wrong. It
stops telling you, and it keeps spending while it does. The whole discipline below exists to earn the
leverage without paying for silence.

## The maturity ladder

Four rungs. Manual prompting, then simple loops, then multi-agent with goals, then fleet
orchestration. Each rung moves more of the work off your hands and onto a system. The rule is to climb
only when the rung below runs reliably. A fleet of agents built on a loop you have never watched
succeed is not progress; it is the same mistake, parallelised. Most founders should live on rungs two
and three for a long time and resist the pull upward.

## The 4-condition test

Build a loop only if all four hold. Miss one and the loop costs more than it returns.

1. **The task repeats.** Weekly or more, same shape. A one-off is a prompt.
2. **Verification is automated.** A test, type check, lint, or build can fail the work without you in
   the room. If only you can judge the output, you are the gate, and a loop with a human gate saves
   nothing.
3. **Your token budget absorbs the waste.** Loops re-read, retry, and explore. Price that in first.
4. **The agent has a senior engineer's tools.** Logs, a reproduction environment, and the ability to
   run the code it writes. Blind, it guesses and you clean up.

The second condition is the one founders skip. They automate a task no machine can grade, then wonder
why they still read every output. If you cannot name the check that fails the work, you do not yet have
a loop. You have a scheduler attached to hope.

## The 5 building blocks plus state

Five blocks assemble a loop. Start with the fewest that close it; add only when a failure demands more.

1. **Automation, the heartbeat.** A schedule, an event, or a trigger. A fixed cadence runs on the
   clock; a goal-based run continues until a written condition holds, checked by a separate model.
2. **Worktree isolation.** Git worktrees so parallel agents do not collide on the same files.
3. **Skills.** The persistent project knowledge the agent reads every run, so you stop re-explaining.
4. **Connectors and MCP.** The reach into GitHub, Linear or Jira, Slack, the error tracker: how the
   loop finds the work and reports the result.
5. **Sub-agents.** Separate the maker from the checker, the evaluator-optimizer pattern, so the gate is
   independent.

Then the piece that holds it together: the **state file**. The agent forgets between runs; the repo
remembers. A `STATE.md` lets the loop resume instead of restart: what is open, what is done, what is
off-limits. Pair it with a standing `VISION.md` or `AGENTS.md` spec the agent rereads each run, or the
constraints quietly vanish through summarisation. The agent forgets. The repo must not.

## The minimum viable loop

One automation, one skill, one state file, one gate. That is the whole thing, and it is enough to
start. Build it in order, and do not skip ahead: get one manual run reliable, turn that run into a
skill, wrap the skill in a loop with a gate and a hard stop, then schedule it. Never schedule a run you
have not watched succeed.

Judge the loop by one number: **cost per accepted change**, not tokens spent or tasks attempted. A loop
can run a thousand iterations and produce nothing you kept. Below roughly half of changes accepted, the
loop is losing. Tighten the gate or kill it.

## The failure modes

Loops fail in recognisable ways. Name them so you can design against them.

| Failure mode | What it is | The fix |
|---|---|---|
| **The Ralph Wiggum loop** | No real gate, soft completion, no hard stop; it fails quietly while it spends | An objective gate plus a hard stop, before you schedule |
| **Goal drift** | Long sessions lose constraints to lossy summarisation; the loop wanders off | Reread a standing spec every run |
| **Self-preferential bias** | The maker grades its own homework kindly | A separate verifier sub-agent on the gate |
| **Agentic laziness** | "Done enough" with the real job unfinished | An objective stop condition checked by a fresh model |
| **Comprehension debt** | Diffs ship unread; nobody holds the system in their head | Read the diffs, spot-check the gate, keep the loop off architecture |

Two of these are about money and two are about understanding, and the understanding ones are worse. A
Ralph Wiggum loop wastes a budget you can refill. Comprehension debt and the cognitive surrender behind
it cost you the thing you cannot refill: a working grasp of your own system. Pair-design the hard parts.
Keep the loop on the repetitive middle, never on the decisions that set the shape.

There is a security tax too. An unattended loop is an unattended attack surface: unreviewed generated
code, skills that act as prompt-injection vectors, credentials leaking into logs, permission scope
creeping wider than anyone signed off. Re-audit permissions on a schedule. Treat fetched content and
skills as untrusted input, because they are.

## In hard mode

In food, health, and deeptech, the gate is not the test suite. A loop may draft, reproduce, propose,
and queue. It must never act unattended on anything irreversible or safety-relevant: a dose, an allergen
call, a regulatory filing, a payment. Human-on-the-loop is mandatory, and the gate must include the
safety check, not just the green build. A passing test proves the code runs. It says nothing about
whether the allergen threshold is right. This is where the OS's HOTL principle meets loop engineering:
the loop proposes, a named human disposes, and the safety check sits inside the gate, not beside it.

## Further reading and credit

The loop framing is associated with **Boris Cherny** (Claude Code) and **Addy Osmani**'s
loop-engineering writing (addyosmani.com). The **Ralph Wiggum loop** was named and documented by
**Geoffrey Huntley**. The **maker-checker** and **evaluator-optimizer** pattern comes from
**Anthropic**'s engineering writing on building effective agents. The debated productivity numbers
around agentic coding are contested; attribute them and mark them contested if you cite them at all,
and never assert them as fact.

The runnable method: [`skills/design-a-loop/`](../skills/design-a-loop/SKILL.md). Cadences you schedule
live in [`loops/`](../loops/).

---

*Part of [AI-Native OS](../README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
