# Agentic Patterns

These are the repeatable shapes for getting real work out of agents, and the anti-patterns that quietly sink teams. Pick the right shape and an agent finishes the job; pick the wrong one and you get an expensive demo that breaks in production. AI-Native OS is built on the good ones here.

### ReAct

A loop where the agent alternates between reasoning out loud and taking an action, feeding each result back in before deciding the next move.

The name is short for "Reason + Act." Instead of thinking once and then firing a batch of tool calls blind, the agent writes a thought ("I need the user's current plan"), takes one action ([tool-call](03-tools-and-environment.md#tool-call)), reads the result, and reasons again with that new fact in hand. It is the difference between a chess player who calculates one move, sees the board, then calculates the next, versus one who plans twenty moves against an imaginary opponent.

For your work: ReAct is the default control loop for almost every useful [agent](03-tools-and-environment.md#agent). It makes behaviour debuggable, because every action is preceded by a stated reason you can read in the trace. When an agent does something dumb, the reasoning step usually tells you exactly where the logic went wrong.

_Avoid:_ calling ReAct a prompting trick. It is a control loop: reasoning is interleaved with real tool results, not generated once up front.

_Usage:_
> "The agent kept booking the wrong room. Pull the ReAct trace. I want to see what it reasoned right before the failed call."

Related: [chain-of-thought](#chain-of-thought), [tool-call](03-tools-and-environment.md#tool-call), [agent](03-tools-and-environment.md#agent), [infinite-loop-runaway-agent](05-failure-modes.md#infinite-loop-runaway-agent)

### Chain-of-thought

Prompting the model to work through a problem step by step before committing to an answer, so the reasoning is visible and the answer is better.

Asking for the answer directly is like asking someone to multiply two large numbers in their head and shout the result. Asking for the steps is handing them a napkin. The model spends more [inference](01-the-model.md#inference) generating intermediate steps, and those steps both improve accuracy on multi-step problems and give you something to inspect when the answer is wrong.

For your work: chain-of-thought is the cheapest reliability upgrade you have for reasoning-heavy tasks: classification with edge cases, math, multi-constraint decisions. It is the reasoning half of [ReAct](#react). Note that the visible "thinking" is a useful artefact, not a guarantee: a model can write plausible steps and still land on a wrong answer, so chain-of-thought makes failures legible, not impossible.

_Avoid:_ treating the written reasoning as proof of correctness. It is a window, not a warranty: a confident chain can still end in a [hallucination](05-failure-modes.md#hallucination).

_Usage:_
> "Make it show its work before it picks a category. When it mislabels something, I need to see which step it fumbled."

Related: [react](#react), [inference](01-the-model.md#inference), [hallucination](05-failure-modes.md#hallucination), [eval](06-evaluation-and-safety.md#eval)

### Plan mode

A working phase where the agent produces a written plan and stops, no edits, no side effects, until a human approves it.

Think of it as the contractor walking you through the blueprint before anyone swings a hammer. The agent reads the relevant context, proposes concrete steps, and waits. You catch the bad assumption when it costs a sentence to fix, not after it has rewritten forty files in the wrong direction.

For your work: plan mode is your highest-leverage checkpoint. It converts the riskiest agent failure, confidently doing the wrong thing fast, into a cheap conversation. Reach for it on anything irreversible, expensive, or wide-reaching. The discipline pairs naturally with [spec-first development](#spec-first-development): the plan is where you discover the spec was ambiguous, before the agent guesses.

_Avoid:_ confusing plan mode with [human-on-the-loop](#human-on-the-loop-hotl). Plan mode gates the work before it starts; HOTL reviews outcomes after.

_Usage:_
> "Don't let it touch the repo yet. Run it in plan mode and paste the plan here. I want to approve the approach first."

Related: [spec-first-development](#spec-first-development), [human-on-the-loop-hotl](#human-on-the-loop-hotl), [system-prompt](02-context-and-sessions.md#system-prompt), [agentic-technical-debt](05-failure-modes.md#agentic-technical-debt)

### Spec-first development

Writing a precise specification of what the system should do before any agent generates the code that does it.

A spec is the source of truth the agent builds against and you review against. Vague intent in your head produces vague output on disk; a written spec turns "make it good" into checkable claims. It is the difference between commissioning a bridge with "make it strong" versus a load rating, a span, and a budget.

For your work: with agents, the spec becomes more valuable, not less. The model fills every gap you leave with a plausible guess, so ambiguity is no longer a slow conversation: it is silent, instant, and wrong at scale. A sharp spec is what lets you turn an agent loose and trust the result. It also feeds [tests as harness](#tests-as-harness): the spec says what "correct" means, the tests enforce it.

_Avoid:_ confusing a spec with a wish. "Should be fast and user-friendly" is not a spec; "p95 under 200ms, three clicks to checkout" is.

_Usage:_
> "Before you build it, write the spec: inputs, outputs, edge cases. I'll review that, and the tests get derived from it."

Related: [plan-mode](#plan-mode), [tests-as-harness](#tests-as-harness), [system-prompt](02-context-and-sessions.md#system-prompt), [minimum-viable-agent-mva](07-ai-native-business.md#minimum-viable-agent-mva)

### Tests as harness

Using an automated test suite as the rails that constrain and verify what an agent produces, so the agent can iterate against a hard pass/fail signal instead of your opinion.

A [harness](03-tools-and-environment.md#harness) is the scaffolding an agent runs inside. Tests are the most useful harness there is: they give the agent a target it can check itself against, and they give you a verdict you can trust without re-reading every line. The agent writes code, runs the tests, sees red, fixes, repeats: a [ReAct](#react) loop with an objective grader instead of a human in the chair.

For your work: this is what makes unattended agent work safe. Without a test harness, "it's done" means "the agent thinks it's done." With one, done means the suite is green against a spec you wrote. Write the tests from the [spec](#spec-first-development) first, then let the agent earn each pass. The tests are also your defence against [CACE](05-failure-modes.md#cace-changing-anything-changes-everything): when a change ripples somewhere unexpected, a red test tells you before your users do.

_Avoid:_ letting the agent write the tests and the code in the same breath with no oversight: it will write tests that pass, not tests that matter.

_Usage:_
> "Give it the failing test suite as the harness. I don't want a status update. I want it green and I'll read the diff."

Related: [spec-first-development](#spec-first-development), [react](#react), [harness](03-tools-and-environment.md#harness), [cace](05-failure-modes.md#cace-changing-anything-changes-everything), [eval](06-evaluation-and-safety.md#eval)

### Gateway agent

A single front-door agent that receives every request, decides which specialised [subagent](03-tools-and-environment.md#subagent) should handle it, and routes accordingly.

It is the receptionist, not the surgeon. The gateway holds no deep expertise of its own; its one job is to read the incoming task, pick the right specialist, hand off, and return the result. Behind it sits a roster of narrow agents, each with a tight [system prompt](02-context-and-sessions.md#system-prompt), its own tools, and a small, clean [context window](02-context-and-sessions.md#context-window).

For your work: the gateway is the direct cure for [the God Agent](#the-god-agent-anti-pattern). It lets you grow capability by adding specialists rather than bloating one prompt, and it gives you one place to log, authorise, and rate-limit everything. Routing logic lives in one auditable spot instead of being tangled through a monster prompt nobody dares touch.

_Avoid:_ letting the gateway start doing the work itself. The moment it carries domain logic, you have rebuilt the God Agent with extra steps.

_Usage:_
> "Add the refund flow as its own subagent. The gateway just routes to it. Don't put refund logic in the router."

Related: [the-god-agent-anti-pattern](#the-god-agent-anti-pattern), [agent-pipeline](#agent-pipeline), [subagent](03-tools-and-environment.md#subagent), [system-prompt](02-context-and-sessions.md#system-prompt)

### Critic-judge pairing

A setup where one agent generates the work and a separate agent evaluates it against an explicit rubric before it ships.

The author cannot proofread their own typo: they read what they meant to write. So you split the roles. The generator produces a draft; the critic, running fresh with a written rubric and no attachment to the output, scores it, flags failures, and sends it back. Two minds, one of them adversarial by design.

For your work: critic/judge is how you raise quality without a human reading every output. The leverage is entirely in the rubric: a vague "is this good?" critic is theatre, while "does it cite a source for every claim, and is each source real?" catches real defects. Keep the critic genuinely separate, with its own [context](02-context-and-sessions.md#context-window) and prompt; a critic that shares the generator's state just nods along. The same machinery powers an [eval](06-evaluation-and-safety.md#eval) when you swap the live critic for a scored test set.

_Avoid:_ calling it self-correction. The whole point is a second, independent evaluator, not the same agent grading itself.

_Usage:_
> "Wire a judge agent behind the writer. Rubric first: it rejects any draft with an unsourced claim and bounces it back."

Related: [eval](06-evaluation-and-safety.md#eval), [human-on-the-loop-hotl](#human-on-the-loop-hotl), [agent-pipeline](#agent-pipeline), [red-teaming](06-evaluation-and-safety.md#red-teaming)

### Human-on-the-loop (HOTL)

A control model where humans set the goals and review the outcomes, while agents execute the steps in between autonomously.

The distinction that matters: human-*in*-the-loop means a person approves every individual action: the agent asks permission before each move. Human-*on*-the-loop means the person sits above the loop, defines what success looks like, lets the agent run, and inspects the result. It is the difference between a driving instructor with a second brake pedal and a fleet manager reading the day's delivery reports.

For your work: HOTL is the only economic model that scales. If a human must bless every step, the agent saves no time: you have automated nothing and added latency. The craft is putting the human at the right altitude: high enough that agents do real work unattended, low enough that a bad outcome is caught before it reaches a customer. [Critic/judge](#critic-judge-pairing) automation and [self-healing fallback](#self-healing-fallback) are what let you raise that altitude safely.

_Avoid:_ using HOTL when you mean human-in-the-loop. They are opposite cost structures: one scales, one doesn't.

_Usage:_
> "We're going human-on-the-loop for onboarding. Agents run it end to end; you review the daily exceptions queue, not every signup."

Related: [plan-mode](#plan-mode), [critic-judge-pairing](#critic-judge-pairing), [self-healing-fallback](#self-healing-fallback), [one-ten-hundred](07-ai-native-business.md#one-ten-hundred)

### Self-healing fallback

A pattern where an agent that hits an error tries to diagnose and recover on its own, retry, reroute, or repair, before escalating to a human or a safe default.

A good agent treats a failed [tool call](03-tools-and-environment.md#tool-call) the way a senior engineer treats a stack trace: read it, form a hypothesis, try the obvious fix. The API returned a 429? Back off and retry. The schema changed? Re-read it and adjust. The recovery is itself a small [ReAct](#react) loop, bounded so it cannot spin forever.

For your work: self-healing is what keeps an unattended agent from face-planting on the first hiccup, and most production hiccups are transient and recoverable. But "self-healing" without limits is how you get a runaway. Cap the retries, and when the agent exhausts them, it must drop to a known-good answer, not keep improvising. That last stop is a [deterministic fallback](06-evaluation-and-safety.md#deterministic-fallback): a hardcoded, predictable response you can always stand behind.

_Avoid:_ confusing self-healing with infinite retry. Recovery without a hard cap and a safe default is just an [infinite loop](05-failure-modes.md#infinite-loop-runaway-agent) wearing a nicer name.

_Usage:_
> "Let it retry the flaky call twice with backoff, then fall back to the deterministic path. No third agent guessing, just the safe answer."

Related: [deterministic-fallback](06-evaluation-and-safety.md#deterministic-fallback), [react](#react), [infinite-loop-runaway-agent](05-failure-modes.md#infinite-loop-runaway-agent), [human-on-the-loop-hotl](#human-on-the-loop-hotl)

### The God Agent (anti-pattern)

One enormous agent expected to do everything, every task, every tool, every domain, behind a single sprawling prompt. This is an anti-pattern. Don't build it.

It feels like progress: one agent to rule them all, no routing to design. Then the prompt grows to four thousand words of contradictory instructions, the [context window](02-context-and-sessions.md#context-window) fills with irrelevant tools on every call, and no two people can agree on what one edit will break. It is the 5,000-line file of the agent world: touch anything and something unrelated fails ([CACE](05-failure-modes.md#cace-changing-anything-changes-everything)).

The fix is structural and not optional: **split it into specialised agents behind a [gateway agent](#gateway-agent).** Each specialist gets a short prompt, a small tool set, and a clean context; the gateway routes. You debug one narrow agent at a time, add capability by adding specialists, and the blast radius of any change stays small. If you remember one rule from this category, make it this one.

_Avoid:_ calling a big agent "powerful" or "general." Past a point, more scope is more fragility, not more capability.

_Usage:_
> "Stop bolting features onto the mega-prompt: that's the God Agent. Break it into specialists and put a gateway in front."

Related: [gateway-agent](#gateway-agent), [agent-pipeline](#agent-pipeline), [agentic-technical-debt](05-failure-modes.md#agentic-technical-debt), [cace](05-failure-modes.md#cace-changing-anything-changes-everything)

### Agent pipeline

A chain of specialised agents where each one's output is the next one's input, like stations on an assembly line.

Instead of asking one agent to research, draft, fact-check, and format in a single pass, you give each step its own agent: a researcher hands findings to a writer, who hands a draft to a [critic](#critic-judge-pairing), who hands an approved version to a formatter. Each station does one thing well, with a focused prompt and a clean [context](02-context-and-sessions.md#context-window), and you can inspect the artefact between any two stages.

For your work: pipelines turn a fuzzy "do the whole job" task into a sequence of checkable handoffs. When output is wrong, you find the broken station instead of re-rolling the entire job. Where a [gateway agent](#gateway-agent) routes *one* task to the *right* specialist, a pipeline runs a task *through* a fixed sequence of them. Keep stages narrow and the contracts between them explicit: a loose handoff is where errors quietly compound.

_Avoid:_ confusing a pipeline (sequential stages) with a gateway (one-shot routing). Different shapes for different jobs.

_Usage:_
> "Make it a pipeline: research → draft → judge → format. If the output's off, I want to know which stage produced the bad artefact."

Related: [gateway-agent](#gateway-agent), [critic-judge-pairing](#critic-judge-pairing), [the-god-agent-anti-pattern](#the-god-agent-anti-pattern), [agentic-technical-debt](05-failure-modes.md#agentic-technical-debt)

### The 1000x engineer

The mythical individual who, armed with agents, supposedly out-produces a thousand peers, and the more useful, sober reality behind the hype.

The honest version: a sharp operator who designs the [spec](#spec-first-development), builds the [test harness](#tests-as-harness), wires up [pipelines](#agent-pipeline) and [gateways](#gateway-agent), and supervises [on the loop](#human-on-the-loop-hotl) can now do the work of a small team. That is real, and it is a lot. The literal "1000x" is marketing. Output still bottlenecks on the slow human parts: judgement, taste, knowing what is worth building, and reviewing what the agents produced.

For your work: aim to multiply yourself, not to believe a number. The leverage comes from the patterns in this file, specialised agents, hard verification, the human placed at the right altitude, not from one heroic prompt. An "engineer" who skips the harness and trusts the agent isn't 1000x; they are one [agentic-technical-debt](05-failure-modes.md#agentic-technical-debt) incident away from being slower than before they started.

_Avoid:_ taking the multiplier literally, or using it to justify shipping unreviewed agent output. Leverage without verification is just faster mistakes.

_Usage:_
> "Sure, you're a 1000x engineer. Show me the test harness and the eval. Leverage without verification is just debt with a velocity."

Related: [tests-as-harness](#tests-as-harness), [human-on-the-loop-hotl](#human-on-the-loop-hotl), [agent-pipeline](#agent-pipeline), [one-ten-hundred](07-ai-native-business.md#one-ten-hundred)

### Loop (agentic loop)

A small system that finds the work, hands it to an agent, checks the result, records what happened, and decides the next move on its own.

The unit is not the prompt; it is the cycle. A loop reads the state, picks the next task, runs the agent, grades the output against a gate, writes down what changed, and starts again, all without you typing between turns. Where [ReAct](#react) is the loop inside a single task, an agentic loop is the loop around the whole job: it can run for an hour, a night, a week. You design it once and it prompts the agent from then on.

For your work: a loop is leverage you build, not buy. It earns its keep only when the task repeats, a machine can grade it, your budget can absorb the retries, and the agent has real tools. The same machinery that saves you a week of toil will, with no gate, spend that week producing nothing you checked. Build the gate and the [hard stop](#the-ralph-wiggum-loop) before you build the schedule.

_Avoid:_ calling any scheduled prompt a loop. Without a gate that can fail the work and a stop that can halt it, you have a timer wired to hope.

_Usage:_
> "Don't just cron the prompt. If there's no gate and no stop, it's not a loop, it's a way to burn tokens on autopilot."

Related: [loop-engineering](#loop-engineering), [the-ralph-wiggum-loop](#the-ralph-wiggum-loop), [react](#react), [maker-checker-split](#maker-checker-split), [cost-per-accepted-change](#cost-per-accepted-change), [infinite-loop-runaway-agent](05-failure-modes.md#infinite-loop-runaway-agent)

### Loop engineering

The discipline of designing the system that prompts the agent, instead of typing the prompts yourself.

The leverage has moved up a level. For two years the skill was wording a request well and steering each turn by hand. Loop engineering is the next rung: you build the [loop](#loop-agentic-loop) that finds work, checks it, and decides the next move, then you step out of the inner cycle. The maturity ladder runs manual prompting, simple loops, multi-agent with goals, fleet orchestration, and you climb only when the rung below runs reliably.

For your work: this is where a [God Agent](#the-god-agent-anti-pattern) is tempting and wrong. A loop is built from small parts, an automation, a skill, a state file, a gate, a [maker-checker split](#maker-checker-split), not one heroic prompt doing everything. Judge the whole thing by [cost per accepted change](#cost-per-accepted-change), and keep yourself on the architecture while the loop handles the repetitive middle.

_Avoid:_ confusing loop engineering with prompt engineering. One designs the system that prompts; the other writes a single better request.

_Usage:_
> "Stop hand-steering every run. This task repeats and a test can grade it: that's a loop-engineering job, not a prompting job."

Related: [loop-agentic-loop](#loop-agentic-loop), [automation-heartbeat](#automation-heartbeat), [state-file-loop-memory](#state-file-loop-memory), [maker-checker-split](#maker-checker-split), [the-god-agent-anti-pattern](#the-god-agent-anti-pattern), [cost-per-accepted-change](#cost-per-accepted-change)

### Automation (heartbeat)

The trigger that starts each pass of a loop without you: a schedule, an event, or a written goal condition.

This is the pulse that keeps a loop alive. A cadence-based heartbeat fires on the clock, nightly, hourly, on every push. A goal-based heartbeat runs until a written condition holds, checked by a separate model rather than the agent's own say-so. The event kind wakes the loop when something happens: a red build, a new issue, a Slack message. No heartbeat, no loop; just a script you run by hand.

For your work: pick the heartbeat to match the work. Repetitive maintenance wants a cadence; a bounded objective wants a goal with an independent check; reactive triage wants an event. The danger is a goal heartbeat with no objective stop, which is one short step from an [infinite loop](05-failure-modes.md#infinite-loop-runaway-agent). Always pair the heartbeat with a hard cap on iterations, time, and tokens.

_Avoid:_ a goal-based heartbeat whose stop condition is the agent deciding it is finished. Have a fresh model check the condition, or it never truly stops.

_Usage:_
> "Make it a nightly cadence with a token ceiling. If you want a goal heartbeat instead, a separate model has to confirm the stop condition."

Related: [loop-agentic-loop](#loop-agentic-loop), [loop-engineering](#loop-engineering), [the-ralph-wiggum-loop](#the-ralph-wiggum-loop), [infinite-loop-runaway-agent](05-failure-modes.md#infinite-loop-runaway-agent), [self-healing-fallback](#self-healing-fallback)

### Worktree isolation

Giving each parallel agent its own git worktree so concurrent loops do not collide on the same files.

Run several agents against one checkout and they overwrite each other's edits, trip each other's builds, and leave a history nobody can read. A worktree is a separate working directory backed by the same repository: each agent gets a clean, isolated copy of the tree, makes its changes, and the results merge back deliberately. It is the difference between three cooks in one pan and three cooks at three stations.

For your work: isolation is what makes a fleet safe to run at all. Without it, parallelism multiplies the blast radius of every mistake. With it, a bad run is contained to one worktree you can throw away. The housekeeping cost is real: abandoned worktrees accumulate, so clean them up as part of the loop, not as an afterthought.

_Avoid:_ running parallel agents against a shared working directory. Shared state plus concurrent writers is a corruption bug waiting for a deadline.

_Usage:_
> "Before we fan out to four agents, give each one its own worktree. I don't want them stepping on each other's diffs."

Related: [loop-engineering](#loop-engineering), [subagent](03-tools-and-environment.md#subagent), [sandbox](03-tools-and-environment.md#sandbox), [cace](05-failure-modes.md#cace-changing-anything-changes-everything)

### State file (loop memory)

A file the loop reads and writes each run so it resumes instead of restarting: what is open, what is done, what is off-limits.

The agent forgets between runs; the repo remembers. A `STATE.md` holds the working memory the model loses when its [context window](02-context-and-sessions.md#context-window) clears: open tasks and their attempt counts, what finished, what must never be touched, the budget left. The loop reads it at the start of a run and writes it at the end, so run forty-one picks up where run forty stopped rather than rediscovering the whole problem. Pair it with a standing spec the agent rereads each run, so constraints survive too.

For your work: the state file is the cheapest defence against [goal drift](#the-ralph-wiggum-loop) and wasted re-work. It also gives you a human-readable log of what the loop has been doing while you slept. Keep it small and structured, keep secrets out of it, and treat the standing spec as read-only ground truth the loop is not allowed to edit away.

_Avoid:_ relying on the model's context to carry state across runs. Context is lossy and clears; the file is the only durable memory the loop has.

_Usage:_
> "Have it write a STATE.md every run, open items, attempts, what's off-limits. I want it to resume, not start the triage from scratch each night."

Related: [loop-agentic-loop](#loop-agentic-loop), [memory-system](02-context-and-sessions.md#memory-system), [context-rot](05-failure-modes.md#context-rot), [loop-engineering](#loop-engineering), [comprehension-debt](#comprehension-debt)

### Maker-checker split

Separating the agent that produces the work from the agent that grades it, so nothing passes on its author's own verdict.

A maker that grades its own homework marks generously: it reads what it meant to write, not what it wrote. The split puts a second agent on the gate, running fresh with its own [context](02-context-and-sessions.md#context-window) and an explicit rubric, with no stake in the output. This is the evaluator-optimizer pattern, the same machinery as [critic-judge pairing](#critic-judge-pairing), applied as the gate inside a loop rather than a one-off review.

For your work: the split is the direct fix for self-preferential bias, the tendency of a model to rate its own output too kindly. The leverage lives in keeping the checker genuinely independent. A checker that shares the maker's context or prompt just nods along and you have paid for theatre. In a loop, the checker is the gate; if it is not separate, you have no gate at all.

_Avoid:_ letting one agent both do the work and declare it done. Self-grading is not verification; it is a rubber stamp the model holds itself.

_Usage:_
> "Split it: one agent fixes the failure, a separate one grades the diff against the rubric. The maker doesn't get to mark its own work."

Related: [critic-judge-pairing](#critic-judge-pairing), [eval](06-evaluation-and-safety.md#eval), [loop-agentic-loop](#loop-agentic-loop), [human-on-the-loop-hotl](#human-on-the-loop-hotl), [the-ralph-wiggum-loop](#the-ralph-wiggum-loop)

### The Ralph Wiggum loop

A loop with no real gate, soft completion, and no hard stop: it fails quietly while it keeps spending. This is an anti-pattern. Don't ship it.

Named and documented by Geoffrey Huntley, after the cartoon child who is cheerfully, obliviously wrong. The loop runs, declares itself done on its own say-so, and produces output nobody graded, all while the meter runs. There is no objective check that can fail the work and no hard cap that can halt the spending, so the failure is silent: green logs, an empty result, and a bill. It is an [infinite loop](05-failure-modes.md#infinite-loop-runaway-agent) with a confident smile and a [silent failure](05-failure-modes.md#silent-failure) wearing a schedule.

The fix is not subtle and not optional: every loop needs an objective gate (a [maker-checker split](#maker-checker-split), a test, a build) and a hard stop (a cap on iterations, wall-clock time, and tokens), plus an objective goal-stop checked by a fresh model so "done enough" is not the maker's call. Read the diffs and spot-check the gate. If you cannot say what fails the work and what halts the loop, you have built one of these.

_Avoid:_ trusting a loop's own "completed" status. Soft completion plus no hard stop is the whole anti-pattern; the agent will spend cheerfully forever.

_Usage:_
> "This is a Ralph Wiggum loop: no gate, no cap, no idea if the output's any good. Bolt on a real check and a hard stop before it runs again."

Related: [loop-agentic-loop](#loop-agentic-loop), [maker-checker-split](#maker-checker-split), [infinite-loop-runaway-agent](05-failure-modes.md#infinite-loop-runaway-agent), [silent-failure](05-failure-modes.md#silent-failure), [cost-per-accepted-change](#cost-per-accepted-change), [human-on-the-loop-hotl](#human-on-the-loop-hotl)

### Comprehension debt

The widening gap between what your automated loops produce and what you actually understand about your own system.

Agentic technical debt is messy code the agents left behind. Comprehension debt is messier: it is the understanding you lost while the loop ran. Diffs merge unread, decisions get made inside a cycle you stopped watching, and one day no human in the building can explain why the system does what it does. The cognitive surrender behind it is the quiet bit, accepting the loop's output because reading it is tedious, until accepting becomes the only option you have left.

For your work: this is the failure mode that does not show up on a budget. A [Ralph Wiggum loop](#the-ralph-wiggum-loop) wastes money you can refill; comprehension debt costs you the grasp of your own product, which you cannot. Pay it down deliberately: read the diffs, spot-check the gate, keep the loop off architecture and on the repetitive middle, and pair-design the parts that set the shape. The loop is allowed to do the work. It is not allowed to be the only thing that understands it.

_Avoid:_ treating a green gate as permission to stop reading. The gate proves the work passed a check; it does not transfer understanding to you.

_Usage:_
> "We're racking up comprehension debt: four loops shipping daily and nobody's read a diff in a week. Slow down and read before we lose the plot entirely."

Related: [agentic-technical-debt](05-failure-modes.md#agentic-technical-debt), [the-ralph-wiggum-loop](#the-ralph-wiggum-loop), [loop-engineering](#loop-engineering), [state-file-loop-memory](#state-file-loop-memory), [verification-deficit](05-failure-modes.md#verification-deficit)

### Cost per accepted change

The metric that judges a loop: total spend divided by the number of changes a human actually accepted.

Tokens burned and tasks attempted measure effort, not value, and a loop can produce a great deal of both while shipping nothing you keep. Cost per accepted change ties the bill to the outcome: every retry, re-read, and failed attempt counts in the numerator, and only changes that passed the gate and survived review count in the denominator. It is the unit economics of a loop, the figure that tells you whether the leverage is real.

For your work: watch the acceptance rate behind it. Below roughly half of changes accepted, the loop is losing, the gate is too loose, the task is a poor fit, or the agent lacks the tools to do it right. A loop that produces ten accepted changes cheaply beats one that attempts a hundred and lands twelve. Track this from the first scheduled run; it is how you decide to tune the gate or kill the loop.

_Avoid:_ reporting tokens spent or tasks run as if they were progress. Effort is not output; only an accepted change is.

_Usage:_
> "I don't care how many tasks it tried. What's the cost per accepted change? If acceptance is under half, the gate's wrong or the loop shouldn't exist."

Related: [loop-engineering](#loop-engineering), [the-ralph-wiggum-loop](#the-ralph-wiggum-loop), [maker-checker-split](#maker-checker-split), [eval](06-evaluation-and-safety.md#eval), [decoupling-headcount-from-revenue](07-ai-native-business.md#decoupling-headcount-from-revenue)

*Part of [The Dictionary of AI-Native](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
