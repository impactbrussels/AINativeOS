# AI-Native OS: Agent Instructions (Codex mirror)

> This mirrors `CLAUDE.md` for harnesses that read `AGENTS.md` (Codex). Cursor reads
> `.cursor/rules/ai-native-os.mdc`; Gemini CLI reads `GEMINI.md`. Keep all mirrors in sync with
> `CLAUDE.md`, which is the canonical master file.

## What this is

AI-Native OS, the open operating system for building an AI-native company. A theme-agnostic
library of **skills**, **flows**, **loops**, and **advisor agents**, paired with a **Handbook**
(method) and a **Dictionary** (vocabulary), covering the build arc:

```
Frame → Architect → Build → Trust → Ship → Grow → Defend
```

**The defining test, Remove-the-AI:** take the AI out of the product; if it still works, it is an
AI feature, not an AI-native company. Push every design toward systems that break without their
intelligence.

Unsure where a founder is? Run the `start-here` skill first. Full map: `docs/STAGES.md`. Skills
live in `skills/`; flows in `flows/`; loops in `loops/`; advisor agents in `agents/`; the method in
`handbook/`; the vocabulary in `dictionary/`.

## Operating principles (enforce every time)

1. **Remove-the-AI test on every design**: does it break without the intelligence? If not, it's a wrapper.
2. **Architecture before code**: specify the system (`SYSTEM-INVENTORY`) before generating it.
3. **Research before asserting**: verify checkable claims or label them assumptions; invent no numbers.
4. **A demo is not evidence**: name what still needs a human call and what still needs validation.
5. **Adversarial by default**: make the model refute your idea, not justify it.
6. **Human-on-the-loop in sensitive domains**: agents execute, humans review; require deterministic fallbacks.
7. **Stay theme-agnostic**: use the placeholder glossary; bake in no sector.

## Learning loop

After any real outcome, run `capture-learning` to append a dated, sourced lesson to
`knowledge-base/` (`PRINCIPLES.md`, `DOS-AND-DONTS.md`, `PLAYBOOK-LESSONS.md`, `MOATS-LEDGER.md`).
Append, never overwrite. Read the KB before substantive work.

## Tooling

Skills speak in actions, not tool names. Per-platform mapping: `docs/cross-platform-guide.md`.
Codex equivalents: `Read`→`shell` (cat), `Write/Edit`→`apply_patch`, `Bash`→`shell`,
`WebSearch`→`web_search`, `Agent`→`spawn_agent`/`wait_agent`, `TodoWrite`→`update_plan`.

## Licensing and attribution (preserve)

Content CC-BY-4.0, code Apache-2.0. Attribution required: **AI-Native OS by Adam M. Adamek
(Impact Brussels ASBL)**. See `ATTRIBUTION.md`.
