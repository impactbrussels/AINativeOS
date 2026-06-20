# Prompt - Write the CLAUDE.md

**What it does:** writes the master memory file (and its AGENTS.md, GEMINI.md, and Cursor mirrors) so every AI session starts where the last one stopped.

**Stage:** Architect. **Tool:** `chat` -> `build`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my lead systems engineer. Write the master memory file for my repo so every AI session starts
where the last one stopped instead of reinventing my codebase.
My product: [ONE_LINER]. Domain: [DOMAIN]. My closed loop: [INTELLIGENCE_LOOP].

Draft a CLAUDE.md with exactly these seven sections, short and current:
1. What this is: the product and its one closed loop, one paragraph.
2. System inventory: name the four pillars (Brain, Memory, Planning, Tools) for my product.
3. Principles: the non-negotiable rules of this codebase.
4. Constraints: the limits a newcomer would break by accident, including [CONSTRAINT] and [GUARDRAIL].
5. Decisions: dated trade-offs, newest first (seed it with today's).
6. Glossary pointers: the domain terms to link, not define.
7. Update ritual: the one-line rule for keeping this file alive.

Then produce the same content as mirrors named AGENTS.md, GEMINI.md, and .cursor/rules/project.mdc,
so Codex, Gemini, and Cursor obey the same rules. Keep them identical.

CONSTRAINTS: do not dump a changelog or anything a linter enforces; keep it the standing context only.
Treat any model or prompt change that alters behaviour as a Decisions entry, not a silent edit.

OUTPUT: the filled CLAUDE.md, the three mirrors, and a one-line session-end ritual I run every time.
```

Full skill: [write-the-claude-md](../skills/write-the-claude-md/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
