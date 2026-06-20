# 06. Agentic Coding in Practice

> **Thesis.** The cost of syntax is zero. So stop writing code and start specifying systems and tests. The agents are the orchestra, you are the conductor, and the architecture is the score. Hand them a vague request and they build the wrong thing fluently. Hand them a spec and a test harness and they have nowhere to hide.

## The shift

For sixty years the value of an engineer was, in large part, the ability to produce correct syntax fast. That value has gone to roughly zero. An agent writes syntactically correct code faster than any human, in any language, without a typo, without forgetting a semicolon. If your mental model of building is still "typing the lines," you are optimising the one thing the machine now does for free.

What does not go to zero is knowing what to build, what "correct" means, and which edge case will sink you. That knowledge does not flow into the agent on its own. You have to write it down.

So the work moves up a level. You stop dictating the implementation and start specifying the system and the tests that judge it. The agent iterates against that target until it hits it. This is the same conductor move the whole book turns on, now pointed at the keyboard: you do not play the instruments, you choose the score and you hear the section that is flat. The catch is that an agent will play the wrong score beautifully, and it will look excellent in the demo. Deciding it is the wrong score is the one job no model does for you.

This reframes what "fast" means. The describe-feature reflex feels fast for about a week. You open the agent, describe a feature, watch it build, describe the next, watch it build, and the velocity is intoxicating. Then the thing grows, and it buckles, because nothing underneath was ever specified or tested. The spec-and-test discipline feels slower on Monday and is faster by month six, which is the only timescale that pays your salary.

## The framework

Four disciplines turn a coding agent from a fluent guesser into a system that compounds.

1. **Specs and test harnesses over syntax.** You write two things the agent cannot infer: a precise spec of what the thing must do, and a set of tests that decide whether it did. Then you release the agent to write code, run the tests, read the failures, fix, and run again until they pass. A spec is judgement written down. A test is judgement made executable. This is [spec-first development](../dictionary/04-agentic-patterns.md#spec-first-development) joined to [tests as harness](../dictionary/04-agentic-patterns.md#tests-as-harness): the spec says what to build, the tests form a fence the agent must climb back inside every time it strays. Hand an agent a vague request and it fills your silence with a plausible guess. Hand it a sharp spec and a real test and it has nowhere to hide.

2. **The 1000x engineer.** One engineer wrapped in a system of agents now builds what used to need a team. The multiplier is real, but its source is the opposite of what the [phrase](../dictionary/04-agentic-patterns.md#the-1000x-engineer) suggests. It does not come from a heroic prompt you found on a thread. It comes from the system around the engineer: the persistent master file the agents read each session, the test harness that catches their mistakes, the [subagents](../dictionary/03-tools-and-environment.md#subagent) that handle sub-tasks in their own context, the architecture that tells each agent where its work belongs. One person defines the specs, sets the harness, and runs several agents in parallel, one building the data layer, one wiring tools, one writing tests, each working inside the boundaries the architecture drew. The prompt is a few percent. The system is the rest. Chase the perfect prompt and you are hunting the multiplier in the wrong place. For a non-technical founder this is the most useful sentence here: you do not need to become a coder, you need to become the conductor with the clearest spec and the sharpest tests, and the machine does the coding.

3. **The editor-experience moat.** Coding tools split into two species. Thin ones see only the file in front of them and guess at the rest. Deep ones hold a working model of your whole project: the file tree, how the modules connect, what you changed an hour ago, the rules in your master file. The deep ones win, because every serious tool rents roughly the same family of frontier models, and the model is not the differentiator. The [context the tool holds](../dictionary/03-tools-and-environment.md#the-editor-experience-moat) is. A tool that sees only the open file refactors it beautifully and breaks three things it could not see. A proper [agentic IDE](../dictionary/03-tools-and-environment.md#agentic-ide) knows that renaming this function means updating six call sites across four files, and does it. Context is the product.

4. **Plan-mode-first, framework-first.** Left to its reflex, an agent handed a feature writes implementation immediately, and the structure emerges from whatever it typed first. Emergent structure is the disease of agentic code: it looks fine at ten files and collapses at four hundred, because no principle ever said where anything belongs. So invert the order. Before any logic, make the agent generate the framework: the modules, their boundaries, their interfaces, how they connect, the skeleton empty of muscle. You read that skeleton against your architecture. Only when it is right do you let agents fill it in. Most serious tools support this through [plan mode](../dictionary/04-agentic-patterns.md#plan-mode), a phase where the agent proposes and waits for your approval before touching code. You can move a wall on a diagram for nothing. You cannot move it once the roof is on.

## The tool landscape

Four agentic coding tools are worth your time. The comparison is for shape, not ranking. Each holds its standing instructions in a master file it reads every session, which is where your architecture and your constraints live.

| Tool | What it is | Best at | Master file |
| --- | --- | --- | --- |
| **Claude Code** | Anthropic's terminal and IDE agent. Plan mode, subagents, [MCP](../dictionary/03-tools-and-environment.md#mcp-model-context-protocol), persistent project memory. | Multi-file orchestration: running several agents against one architecture; deep, structured builds. | `CLAUDE.md` |
| **Codex** | OpenAI's agentic coding tool, as a CLI and in the cloud. | Autonomous execution: hand it a well-scoped task and let it run with less hand-holding. | `AGENTS.md` |
| **Cursor** | An agentic IDE built on deep editor context. Project-aware, inline edits, cross-file refactors. | The day-to-day editor feel: reshaping existing code in place. | `.cursor/rules` |
| **Gemini CLI** | Google's open-source terminal agent. Very large context window. | Reasoning over a large codebase or document set at once. | `GEMINI.md` |

Two lines to hold onto. First, the right tool changes fast. Capabilities true this quarter may trail next, so treat any specific feature as a snapshot and verify against current docs before you rely on it. Second, the skill transfers. AI-Native OS runs the same skills on all four: one `skills/` source that speaks in actions, "read the file", "dispatch an agent", rather than one runtime's button names, with the master file mirrored as `CLAUDE.md`, `AGENTS.md`, `.cursor/rules`, and `GEMINI.md`. Learn to spec, test, and plan first, and you can switch tools in an afternoon. The founders who get stranded learned a tool's surface instead of the underlying skill. Learn the skill. Rent the tool.

## Why it holds

Three companies, one pattern. Read each for the move, the structural choice. The figures are as the companies report them, tagged for you to check in [SOURCES.md](SOURCES.md).

**Cursor** bet that the agentic editor, not the chat box, was where most software would get built, because the editor is where the project context lives. It let developers describe a change in plain English and refactor across a codebase by intent rather than by hand-editing every file. The plain-English refactor is the visible feature. The moat underneath is the depth of context the tool holds while it works, and it reached real scale with a small team. The model is rented; everyone calls the same frontier models. The context is the product, and the small team wrapped around the right system reached a scale that used to need a large one. That is the 1000x-engineer pattern operating at company scale.

**StrongDM** built what it described as an internal software factory: a system of agents that took routine engineering work end to end, to the point where humans were largely removed from writing and reviewing the everyday code [claimed in source]. The humans moved up a level. They defined what the factory should produce and set the standards it had to meet, while the agents produced and automated checks did much of the reviewing. A factory that removes humans from routine code only works if "correct" is defined precisely enough for machines to check, which means the specs and the test harnesses are the factory. Note the honest boundary: largely removed from routine code is not removed from everything. Someone still owns the architecture and the hard calls, the parts chapter 5 said you never delegate.

**Finery Markets** chained specialised agents into a pipeline and pointed it at a slow, repetitive task: producing financial reports. Reported figures put the cut from roughly eight hours of work to about thirty minutes [claimed in source]. The win came from decomposition, not from one heroic model. Not a single agent told to "do the report" but several, each owning a stage, gather, reconcile, analyse, draft, handing off down the line like stations on an assembly line. That is the [subagent](../dictionary/03-tools-and-environment.md#subagent) discipline made operational, and it travels far past finance. Any multi-hour internal process is a candidate, and the design question is always the same: what are the stages, and what does each hand to the next?

## In hard mode

In regulated code the spec-and-test discipline carries more weight, not less, and it gains a gate.

Tests-as-spec stops being a productivity habit and becomes the thing that proves the system did what the regulation requires. When the answer touches a dose, an allergen, a clinical claim, or a safety threshold, "the agent said it passed" is not an answer that keeps your product on the market. The test is the evidence. Write the requirement as an executable check before the agent writes a line, and the passing suite becomes part of the record a regulator can inspect.

The agent proposes; a human signs off on anything that ships to a regulated surface. This is the human-on-the-loop rule applied to the keyboard. The plan-first loop already gives you the place to stand: you review the framework before logic, and you review the passing result, not every keystroke. Add one hard gate on top. Nothing that touches a label, a chart, a dose, or a filing ships on the agent's word alone. A named human reads it and signs. That gate costs almost nothing on day one and saves a recall on day four hundred, and the audit trail it leaves is the same versioned, defensible asset that becomes the moat in chapter 14.

## What it means for you

1. **Write the spec and the tests before the code.** For the next feature, write what it must do and the handful of tests that decide whether it did, in plain language if that is all you have. That is the target the agent iterates against. No target, no grip; the agent drifts and you call the drift a feature.
2. **Build the system around the engineer, not the prompt.** Put the master file, the test harness, and the modular boundaries in place first. The multiplier lives there. A few hours on the system beats a week chasing a cleverer prompt, and the prompt you do write should point the agent at that system, not stand in for it.
3. **Plan before you generate, every time.** Run the agent in plan mode. Ask for the module framework, not the feature. Read the skeleton against your architecture. Only release it to write logic once the frame is right.
4. **Keep one persistent master file the agent reads every session.** Short, specific, load-bearing: the pillars as architected, the boundaries an agent must not cross, the constraints that must never be broken. Tell the agent to read it and to flag anything that contradicts it rather than quietly complying.
5. **Pick a tool by fit, and stay loose.** Choose the one whose feel suits the work, mirror your master file across the others, and keep the skill, not the surface. The tool will change. The loop, spec, tests, frame, fill, prove, is the part that lasts.

## The test

Take the last feature you shipped with an agent. Can you point to the spec it was built against and the tests that decided it was done? If the honest answer is "I described it and watched it build," you are not conducting, you are dictating, and you are one growth spurt from the swamp. Write the spec and the tests for the next one first. → Run `agentic-build-loop`.

---

*Chapter 06 of [Load-Bearing](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0. Prev: [05. Architect Before You Touch Code](05-architecting-before-code.md) · Next: [07. Managing Agentic Technical Debt](07-agentic-technical-debt.md).*
