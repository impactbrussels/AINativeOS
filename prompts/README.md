# AI-Native OS Prompt Library: for founders who don't code

You do **not** need Claude Code, a terminal, or any setup to use AI-Native OS. Every skill ends with
a ready-to-run **copy-paste prompt**, and the full library is here as standalone files you can paste
straight into a chatbot **or a no-code builder**. One prompt per skill, the whole OS, tool-tagged.

## How to use any AI-Native OS prompt (3 steps)

1. **Pick your stage** in the table below and open the skill (or the standalone prompt file).
2. **Copy the block, paste it into your tool, and fill the `[PLACEHOLDERS]`**, the bracketed words
   like `[ICP]` or `[DOMAIN]`. Replace each with your real details. (Don't know a term? The
   [Dictionary](../dictionary/) plain-explains them.)
3. **Run it, then iterate.** Push back, ask for the harder version, say "now try to refute me." A
   prompt is a starting move, not a one-shot.

> **Where am I?** Not sure which prompt you need? Start with **`start-here`**. It diagnoses your
> stage, runs the Remove-the-AI test, and points you to the single next thing to do.

## Which tool for which job

| Tool | Best for | Tag |
|------|----------|-----|
| **Claude.ai / ChatGPT / Gemini** | Thinking, framing, discovery, copy, strategy, anything text. | `chat` |
| **Lovable / Bolt / v0** | Turning a scoped spec into a working web app or landing page, no code. | `build` |
| **Replit Agent** | A runnable backend or script when `build` tools aren't enough. | `build+` |

Every prompt is tagged with the tool it's meant for. Use a `chat` tool to *design*, a `build` tool
to *ship*.

## Two rules that make the prompts work

- **Fill every placeholder.** A prompt with `[PROBLEM]` left in gives generic mush. Specifics in, value out.
- **Don't trust numbers it invents.** If the AI states a market size, a regulatory timeline, or a
  competitor's revenue, make it label the source or call it an assumption, then verify.

---

## The complete prompt library

One standalone prompt per skill, grouped by the journey stage it belongs to:
**Frame -> Architect -> Build -> Trust -> Ship -> Grow -> Defend**, plus the cross-cutting prompts you
reach for at any stage. Lost? Start with **start-here**.

### Frame: turn a vague idea into a falsifiable bet

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [remove-the-ai-test](remove-the-ai-test.md) | Tests whether your idea is AI-native or a wrapper, and how to make it native | Frame | `chat` |
| [frame-the-hypothesis](frame-the-hypothesis.md) | Turns a vague idea into one falsifiable bet, with a structured devil's advocate | Frame | `chat` |
| [hypothesis-mining](hypothesis-mining.md) | Turns a pile of research into a ranked backlog of bets, scored by what kills the company if wrong | Frame | `chat` |
| [customer-discovery-that-doesnt-lie](customer-discovery-that-doesnt-lie.md) | Mom Test interview script, scores your call notes for real pain, names the next belief to test | Frame | `chat` |
| [map-the-terrain](map-the-terrain.md) | Finds your approval clock in months, the one wedge, and where competitors are already the default answer | Frame | `chat` |

### Architect: design the cognitive system before any code

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [architect-before-code](architect-before-code.md) | Designs the Brain, Memory, Planning, Tools and names the closed loop before you generate code | Architect | `chat` → `build` |
| [cognitive-architecture-review](cognitive-architecture-review.md) | Grades an existing system on the four pillars and rules on whether it survives the Remove-the-AI test | Architect | `chat` |
| [write-the-claude-md](write-the-claude-md.md) | Writes the master memory file (and AGENTS.md, GEMINI.md, Cursor mirrors) so every session resumes | Architect | `chat` → `build` |

### Build: agentic coding on a leash

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [agentic-build-loop](agentic-build-loop.md) | Turns vibe-coding into a spec-and-test loop, so the agent builds the right thing | Build | `chat` → `build` |
| [design-a-loop](design-a-loop.md) | Scopes a recurring agentic task into a loop with a gate, a stop condition, and a cost metric | Build | `chat` → `build` |
| [pay-down-agentic-debt](pay-down-agentic-debt.md) | Ranks debt by interest times principal and gives the CACE-safe paydown order | Build | `chat` → `build+` |

### Trust: evaluation and safety before you ship

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [eval-and-safety-harness](eval-and-safety-harness.md) | Builds a binary safety rubric, a separate judge, a deterministic fallback, and the human boundary | Trust | `chat` → `build` |
| [red-team-the-agent](red-team-the-agent.md) | Writes an offensive attack suite, scores it by severity times exploitability, and wires the release gate | Trust | `chat` → `build` |
| [compliance-readiness](compliance-readiness.md) | Maps which frameworks you touch and the evidence each demands; scoping, not legal advice | Trust | `chat` |

### Ship: design a Minimum Viable Agent, not a feature pile

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [design-the-mva](design-the-mva.md) | Scopes the smallest agent that proves the intelligence loop | Ship | `chat` → `build` |
| [self-healing-fallbacks](self-healing-fallbacks.md) | Maps a bounded fallback for every critical path and a fixed non-AI floor where a guess would harm | Ship | `chat` → `build` |

### Grow: narrative, GEO, sales, and real PMF

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [measure-ai-native-pmf](measure-ai-native-pmf.md) | Reads PMF on four lenses instead of a vanity graph: the 40% test, Remove-the-AI, Share of Model, retention | Grow | `chat` |
| [geo-content](geo-content.md) | Structures one piece to be quoted verbatim inside AI-engine answers, with sourced data | Grow | `chat` |
| [share-of-model](share-of-model.md) | Measures how often AI engines cite you vs. competitors and sets your baseline | Grow | `chat` |
| [ai-assisted-sales](ai-assisted-sales.md) | Maps your sales motion and designs every pilot with a success bar and path to paid before it starts | Grow | `chat` → `build` |

### Defend: ops, data flywheels, and moats

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [gateway-agent-ops](gateway-agent-ops.md) | Replaces one drifting mega-assistant with a thin router in front of capped, narrow specialists | Defend | `chat` → `build` |
| [moat-strategy](moat-strategy.md) | Finds what actually defends the company: the data flywheel, the moat type, and a ledger entry | Defend | `chat` |

### Cross-cutting: reach for these at any stage

| Prompt | What it does | Stage | Tag |
|--------|--------------|-------|-----|
| [start-here](start-here.md) | Diagnoses your stage, runs the Remove-the-AI test, and names the single next thing to do | Cross-cutting | `chat` |
| [apply-ai-native-models](apply-ai-native-models.md) | Runs a hard decision through eight mental models, makes the call, names the most fatal assumption | Cross-cutting | `chat` |
| [capture-learning](capture-learning.md) | Turns a real outcome into a dated, sourced lesson and the knowledge-base file to append it to | Cross-cutting | `chat` |

Every skill in [`skills/`](../skills/) also ends with its own `## Copy-paste version`, the source each
standalone prompt above is lifted from. The journey map lives in [`docs/STAGES.md`](../docs/STAGES.md).

---

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). Content licensed CC-BY-4.0.*
