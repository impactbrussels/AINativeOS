# Tools & Environment

A model on its own only produces text. Tools are how that text turns into action: reading a file, calling an API, clicking a button, writing to a database. This category is the bridge from "chatbot" to "agent": the wiring that lets a model reach out of the chat window and change something in the world.

### Tool call

A single request, emitted by the model as structured data, asking the surrounding program to run a named function with specific arguments.

The model never executes anything itself. It writes a message that says, in effect, "call `get_weather` with `city=Brussels`." Your code receives that message, actually runs the function, and feeds the result back into the conversation. The model reads the result and decides what to do next. One turn of that loop is one tool call.

Think of the model as a brain in a jar with no hands. A tool call is the brain shouting an instruction to an assistant who has hands. Nothing happens until the assistant obeys and reports back, which means *you* control what the tools can actually do, and you can refuse, log, or sandbox any call before it runs.

For your work, this is the unit you debug. When an agent misbehaves, you read its tool calls one by one: wrong function, wrong arguments, or a correct call whose result it ignored.

_Avoid:_ saying the model "ran the code" or "hit the API." It requested the call; your harness ran it. That distinction is where most security and reliability work lives.

_Usage:_
> "It's looping: three identical tool calls to `search_db` with the same query, then it ignores all the results. Something's wrong with how we're feeding the output back."

Related: [Function calling](#function-calling), [Harness](#harness), [Agent](#agent), [ReAct](04-agentic-patterns.md#react)

### Function calling

The model capability, and the API shape, that lets a model emit tool calls as structured arguments instead of free-form prose.

You hand the model a list of functions it's allowed to call, each described by a name, a purpose, and a typed schema for its arguments (often JSON Schema). The model, when it decides a function is needed, returns the function name plus arguments that fit the schema. "Function calling" is the mechanism; a "tool call" is one instance of it firing.

The quality of the descriptions matters more than founders expect. The model picks tools by reading their docstrings, the same way a new hire picks which internal API to use by reading its name and comment. Vague descriptions get the wrong tool called; overlapping descriptions get coin-flip behaviour. Treat tool schemas as prompt engineering, not plumbing.

For your work: keep the tool list short. A model choosing among 6 well-named functions is reliable; the same model choosing among 60 starts guessing.

_Avoid:_ treating function calling as a guarantee. The model usually returns valid arguments, but it can hallucinate a function that doesn't exist or fill a field with garbage: always validate before executing.

_Usage:_
> "Renamed the tool from `process` to `refund_order` and added an example to the description. Function calling accuracy jumped: it stopped calling it for unrelated requests."

Related: [Tool call](#tool-call), [Structured output](#structured-output), [Inference](01-the-model.md#inference)

### Structured output

A mode that forces the model's response to conform to a schema you supply, valid JSON matching a defined shape, every time, rather than free-form text.

Function calling answers "which tool, with what arguments." Structured output answers a different question: "give me the *answer itself* as data I can parse." You want a list of extracted invoices, a sentiment score and a category, a populated form. You define the shape; the provider constrains generation so the output can't drift off-schema.

The win is that you delete the fragile glue code: the regexes and string-splitting that used to scrape values out of a paragraph. The model speaks your data format natively, so the boundary between "AI" and "rest of the system" becomes a typed object instead of a prayer.

For your work: schema-constrain anything that feeds another system. Reserve free text for things a human reads. The moment a model's output becomes another function's input, give it a schema.

_Avoid:_ confusing this with function calling: related, but distinct. Structured output shapes the *final answer*; function calling shapes *requests to act*. Also, a valid schema is not a correct value: the JSON parses but the numbers can still be wrong.

_Usage:_
> "Don't ask it to 'return the fields' in prose and parse it ourselves. Set a structured output schema with the five fields typed. Then the downstream service just gets an object."

Related: [Function calling](#function-calling), [Tool call](#tool-call), [Model provider](01-the-model.md#model-provider)

### MCP (Model Context Protocol)

An open, vendor-neutral standard for connecting models to external tools and data sources, so a tool is built once and any compatible client can use it.

MCP was originated by Anthropic and is now broadly adopted across the ecosystem. The idea is a USB-C port for AI: before it, every assistant integrated every tool with its own bespoke glue, your GitHub connector for one client didn't work in another. MCP defines a common protocol so a "server" exposes tools, resources, and prompts, and any "client" (an IDE, a desktop assistant, an agent) can plug in and use them without custom code on both sides.

The shift for builders is that integrations become a market instead of a chore. You write one MCP server for your product's API, and it works in every MCP-aware host. Conversely, you can give your agent a long reach quickly by mounting existing servers: filesystem, database, ticketing, search.

For your work: when you catch yourself writing a one-off connector for the third time, write an MCP server instead. The reuse compounds, and it's where the editor-experience moat is increasingly contested.

_Avoid:_ thinking MCP is owned by one vendor or is a product you buy. It's a protocol, a spec, like HTTP. And it doesn't make tools safe: an MCP server still runs real code, so a malicious or sloppy one is a live attack surface.

_Usage:_
> "Instead of hard-coding the Jira calls into the agent, let's expose them as an MCP server. Then the desktop app, the IDE plugin, and our own agent all talk to the same thing."

Related: [Tool call](#tool-call), [Agent](#agent), [The editor-experience moat](#the-editor-experience-moat), [Prompt injection](05-failure-modes.md#prompt-injection)

### Agent

A model placed in a loop with tools and a goal, deciding its own next step at each turn until the goal is met or it gives up.

A chatbot answers once and stops. An agent runs a cycle: look at the goal and the state so far, choose a tool, call it, read the result, decide whether it's done. That loop, not the model, not the tools, is what makes it an agent. The model is the engine; the loop is the car.

The defining property is that you don't script the steps. You hand over a goal ("reconcile this month's invoices") and the agent improvises the path, which is exactly its power and its danger. It can handle cases you never anticipated, and it can wander into expensive, wrong, or destructive ones with equal confidence.

For your work: the first version of any agent should do the smallest useful job with the fewest tools, run under supervision, and earn autonomy by proving itself. Start with a narrow loop you can watch, not a god agent with root access.

_Avoid:_ calling every LLM feature an "agent." A single prompt-and-response, even a clever one, is not an agent: no loop, no tool-driven decisions, no goal it pursues across turns.

_Usage:_
> "Right now it's a workflow: we hard-coded the five steps. To call it an agent we'd let it pick the steps itself, and honestly I'm not sure we want that level of autonomy on billing yet."

Related: [Subagent](#subagent), [Harness](#harness), [Tool call](#tool-call), [ReAct](04-agentic-patterns.md#react), [Minimum viable agent (MVA)](07-ai-native-business.md#minimum-viable-agent-mva)

### Subagent

A scoped agent spawned by another agent to handle one piece of work in its own fresh context, then report a result back.

When a task is big, a single agent's context window fills with the debris of every sub-step: files it read, dead ends it tried, output it skimmed. A subagent is the fix: the parent delegates "go find every place we call the old API" to a child that does the messy search in its own window, then hands back only the clean answer. The parent's context stays focused on the plan; the noise stays in the child.

It's how you organise labour without drowning. The parent is a manager who assigns a research task and wants the one-paragraph summary, not the analyst's entire browser history.

For your work: reach for subagents when a step is independent, search-heavy, or context-polluting. They also let you parallelise, fanning out several read-only investigations at once, and they let you give each child a tighter toolset than the parent has.

_Avoid:_ assuming the subagent shares the parent's memory. It starts fresh and stateless; everything it needs must be in the prompt you spawn it with, and everything it learns is lost unless it returns it.

_Usage:_
> "Don't let the main agent read all forty files. Spawn a subagent per directory, have each return a summary, and keep the orchestrator's context clean for the actual fix."

Related: [Agent](#agent), [Context window](02-context-and-sessions.md#context-window), [Stateless](02-context-and-sessions.md#stateless), [God agent](04-agentic-patterns.md#the-god-agent-anti-pattern)

### Harness

The program around the model that runs the loop: sending prompts, executing tool calls, feeding results back, managing context, and enforcing limits.

The model is stateless and inert; it only does inference when called. Everything that makes it *act over time* lives in the harness: it holds the conversation, decides which tools to expose, actually runs each tool call, catches errors, retries, trims context when it's full, and stops the loop when a budget or step limit is hit. Claude Code, an agentic IDE, your own Python script wrapping the API: all harnesses.

The metaphor: the model is a Formula 1 engine; the harness is the chassis, fuel system, steering, and brakes. A great engine in a bad chassis loses every race. Most of the difference between a flaky agent and a reliable one is harness quality, not model quality.

For your work: this is where your real engineering lives and where your moat forms. Prompts are easy to copy; a harness that retries intelligently, manages context, and fails safely is hard-won and hard to replicate.

_Avoid:_ blaming the model for what the harness owns. "It forgot the earlier instruction" is usually context the harness dropped; "it ran a destructive command" is usually a tool the harness exposed without a guard.

_Usage:_
> "The model's fine: the harness isn't checkpointing, so when a tool call fails halfway it restarts from zero. That's a chassis bug, not a brain bug."

Related: [Agent](#agent), [Tool call](#tool-call), [Sandbox](#sandbox), [Stateless](02-context-and-sessions.md#stateless), [Human-on-the-loop (HOTL)](04-agentic-patterns.md#human-on-the-loop-hotl)

### Sandbox

An isolated, restricted environment where an agent's tool calls actually run, walled off from your real systems so a bad action can't reach anything that matters.

An agent that can run shell commands, edit files, or hit your network is exactly as dangerous as a confused intern with production credentials. A sandbox is the locked room you put that intern in: a throwaway container, a scratch directory, a network with no route to prod, a database that's a copy. The agent works freely inside; the blast radius stops at the wall.

This is not optional once an agent can write or execute. Models are persuadable and occasionally wrong, and a prompt injection can turn a helpful agent into a hostile one mid-task. The sandbox is what makes "it tried to delete everything" a shrug instead of an incident.

For your work: decide what's inside the wall before you give an agent any write or execute tool. Default-deny the network, give it a disposable filesystem, and grant real access only through narrow, audited tools, not by widening the sandbox.

_Avoid:_ confusing a sandbox with permission prompts. Asking the user "allow this command?" is a speed bump; a sandbox is a wall. You usually want both, but only the wall holds when the human clicks "yes" by reflex.

_Usage:_
> "Before we let it run migrations, it goes in a sandbox with a clone of the DB and no prod credentials. If it nukes the table, it nuked a copy."

Related: [Harness](#harness), [Computer use](#computer-use), [Tool call](#tool-call), [Prompt injection](05-failure-modes.md#prompt-injection)

### Computer use

A capability where a model operates a graphical interface directly, reading the screen from screenshots and issuing mouse and keyboard actions, instead of calling a structured API.

Most tools give the model a clean, typed door into a system: an API, a function, an MCP server. Computer use is for everything with no such door: legacy desktop software, a vendor portal with no API, a workflow that only exists as clicks. The model looks at a screenshot, decides "click the blue button at these coordinates, then type this," and your harness performs the action; a new screenshot comes back, and it goes again.

It's the universal adapter and the slow, fragile one. Anything a human can do on a screen, the model can attempt, but it's reading pixels, so it's slower, more error-prone, and more easily confused by a moved button or a pop-up than a clean API call would be.

For your work: treat computer use as the fallback, not the default. If an API or MCP server exists, use it. Reserve screen-driving for the genuinely closed systems, sandbox it hard, and keep a human watching, because a misread screenshot can click the wrong thing with full confidence.

_Avoid:_ assuming it's as reliable as an API integration. It's a model squinting at a screen and guessing where to click, closer to scripting a human than calling a function.

_Usage:_
> "The supplier portal has no API, so we're using computer use to file the orders. It works, but it breaks every time they reskin the page. We keep an API integration on the wishlist."

Related: [Tool call](#tool-call), [Sandbox](#sandbox), [Agent](#agent), [MCP (Model Context Protocol)](#mcp-model-context-protocol)

### Agentic IDE

A code editor built around an agent that can read, write, run, and test code across your whole project, not a chat box bolted onto a text editor.

The first wave of AI coding was autocomplete: it guessed the next line. An agentic IDE is a different shape: you give it a goal ("add rate limiting to the upload endpoint"), and it explores the codebase, edits several files, runs the tests, reads the failures, and iterates, with you reviewing the diff. The editor is the harness; the agent is the worker; the project is the environment it acts on.

The interesting part is the feedback loop. Because the agent can *run* the code and read the result, it closes the loop a chat assistant can't: it doesn't just suggest a fix, it verifies one. That changes the editor from a place where you type code into a place where you direct work and review outcomes.

For your work: the leverage is real and so is the risk. An agent editing and running code is one bad command from breaking your repo or leaking a secret. Pair it with version control, a sandbox for execution, and a habit of reading every diff.

_Avoid:_ equating "agentic IDE" with "autocomplete." Suggesting the next token and autonomously closing a multi-file task with test feedback are different machines.

_Usage:_
> "Stop pasting snippets into chat: point the agentic IDE at the failing test, let it run the suite, and review the diff it proposes. That's the whole reason we pay for the editor."

Related: [Agent](#agent), [Harness](#harness), [The editor-experience moat](#the-editor-experience-moat), [Agentic technical debt](05-failure-modes.md#agentic-technical-debt)

### The editor-experience moat

The thesis that durable advantage in AI tooling comes not from the model, which everyone can rent, but from the interface, harness, and workflow wrapped around it.

The foundation models are largely a commodity: your competitor can call the same provider you do, and the gap between the best models narrows with every release. So what's defensible? The thing that's expensive to copy: the accumulated craft of the *experience*. How the editor manages context, how it presents diffs, how it recovers from errors, how its tools and MCP integrations fit a real workflow, how it feels in the hand after the hundredth use.

The metaphor: every kitchen can buy the same knives. The restaurant people return to isn't the one with the sharpest knife; it's the one where everything around the knife, the room, the service, the menu, the timing, is dialled in. The model is the knife. The editor experience is the restaurant.

For your work: don't try to out-model the model providers; you'll lose. Compete on the layer they don't own: the harness, the workflow, the trust, the thousand small frictions you remove. That's where retention lives, and retention is the moat.

_Avoid:_ assuming a better base model is a strategy. If your only edge is "we use the newest model," you have no moat: your competitor upgrades next week and erases it.

_Usage:_
> "We're not going to win by having a smarter model than them; we can't. We win on the editor-experience moat: the workflow's tighter, the tools are wired in, and people don't want to relearn ours for a marginally better engine."

Related: [Agentic IDE](#agentic-ide), [Harness](#harness), [MCP (Model Context Protocol)](#mcp-model-context-protocol), [Foundation model](01-the-model.md#foundation-model)

---

*Part of [The Dictionary of AI-Native](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
