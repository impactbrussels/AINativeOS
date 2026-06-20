# Prompt - Capture Learning

**What it does:** turns a real outcome into a dated, sourced lesson and tells you which knowledge-base file to append it to, so the OS stops repeating mistakes.

**Stage:** Cross-cutting. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Gemini).

```
Act as my AI-native learning archivist. Here is a real outcome I just had: [WHAT HAPPENED - the
actual eval score, customer reply, metric move, or failure]. Stage it came from: [DOMAIN / stage].
1. Restate the outcome in plain fact, stripped of hope. If I gave you a hope, not a result, say so.
2. Write it as a dated lesson in this exact shape:
   ### [today's date] - [one-line lesson]
   Context: what I was attempting.
   What happened: the real outcome.
   Lesson: the durable takeaway, written so the next founder avoids my mistake.
   Source: where this came from.
3. Tell me which file to append it to: a durable rule (PRINCIPLES), a tactic (DOS-AND-DONTS), a dated
   outcome (PLAYBOOK-LESSONS), or moat evidence (MOATS-LEDGER).
Append it below what's already there. Never overwrite an older lesson.
```

Full skill: [capture-learning](../skills/capture-learning/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
