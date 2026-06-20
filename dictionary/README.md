# The Dictionary of AI-Native

You cannot build what you cannot name. This dictionary defines the words an AI-native founder lives
in, from `token` to `Share of Model`, so the Handbook and the skills rest on one shared, precise
vocabulary instead of scattered jargon.

It is written in the spirit of Matt Pocock's *Dictionary of AI Coding*: short, opinionated, and
example-driven. Each entry is something you could read in a minute and use in the next meeting.

## How to read it

Entries are grouped into 7 categories, ordered to build a mental model rather than alphabetically:

| # | Category | What it covers |
|---|----------|----------------|
| 01 | [The Model](01-the-model.md) | What the thing under the hood actually is: token, inference, training, knowledge cutoff, temperature. |
| 02 | [Context & Sessions](02-context-and-sessions.md) | How memory works in practice: context window, session, compaction, system prompt, RAG. |
| 03 | [Tools & Environment](03-tools-and-environment.md) | How a model acts on the world: tool call, MCP, agent, subagent, harness. |
| 04 | [Agentic Patterns](04-agentic-patterns.md) | How work gets structured: ReAct, plan mode, gateway agent, critic/judge, human-on-the-loop. |
| 05 | [Failure Modes](05-failure-modes.md) | How it goes wrong: hallucination, sycophancy, model drift, CACE, prompt injection. |
| 06 | [Evaluation & Safety](06-evaluation-and-safety.md) | How you trust it: eval, deterministic fallback, uncertainty quantification, red-teaming, audit trail. |
| 07 | [AI-Native Business](07-ai-native-business.md) | The economics: AI-native vs wrapper, GEO, Share of Model, One-Ten-Hundred, data flywheel, Minimum Viable Agent. |

## The entry template (every entry follows this)

```markdown
### Term

[One sentence that names the concept precisely: what it *is*, not how to use it.]

[1–3 short paragraphs on the mechanics: how it works, why it matters, what's surprising about it.
Prefer a vivid metaphor over jargon. Speak to "what this means for your work."]

_Avoid:_ [a common misconception, misuse, or the wrong word people reach for instead.]

_Usage:_
> "[A realistic line of founder/engineer dialogue that uses the term naturally.]"

Related: [other-term](#other-term), [other-term](04-agentic-patterns.md#other-term)
```

Keep each entry to ~120–350 words. Cross-link generously: the value is the graph, not the list.
A `[[term]]` that points somewhere not yet written marks a future entry, not an error.

---

*The Dictionary of AI-Native is part of AI-Native OS by Adam M. Adamek (Impact Brussels ASBL).
Content licensed CC-BY-4.0. Inspired by Matt Pocock's Dictionary of AI Coding.*
