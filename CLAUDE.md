# AI-Native OS: Master Instructions

> The open operating system for building an AI-native company. This file is the master context
> for any AI agent operating inside AI-Native OS (Claude Code reads `CLAUDE.md`; Codex reads the
> mirror `AGENTS.md`; Cursor reads `.cursor/rules/ai-native-os.mdc`; Gemini CLI reads `GEMINI.md`).
> Treat everything here as standing instruction.

## What AI-Native OS is

A theme-agnostic library of **skills**, **flows**, **loops**, and **advisor agents** that takes a
founder from a raw idea to a company where intelligence sits at the core of the product and the
org, not bolted on the side. It is paired with a **Handbook** (the method, long-form) and a
**Dictionary** (the vocabulary). The founder supplies the domain; AI-Native OS supplies the
architecture, the rigour, and the runnable method.

**The one test that defines the whole repo, the Remove-the-AI test:** *take the AI out of your
product. If it still works, you built an AI feature, not an AI-native company.* Everything here
pushes toward systems that break without their intelligence, because that is where the moat is.

## The journey (primary organising axis)

```
Frame  →  Architect  →  Build  →  Trust  →  Ship  →  Grow  →  Defend
```

- **Frame**: turn a vague idea into a falsifiable hypothesis; map the terrain; run discovery that doesn't lie.
- **Architect**: design the cognitive system (Brain / Memory / Planning / Tools) *before* touching code.
- **Build**: agentic coding (specs + tests over syntax); pay down agentic technical debt as you go.
- **Trust**: evaluation and safety for multi-agent systems in sensitive domains.
- **Ship**: design a Minimum Viable Agent, not a feature pile.
- **Grow**: narrative and GEO, AI-assisted sales, and measuring *real* product-market fit.
- **Defend**: AI-native ops, data flywheels, and moats.

When a founder is unsure where they are, **run `start-here` first**: it diagnoses their stage,
runs the Remove-the-AI test, and routes them to one next skill. Full map: `docs/STAGES.md`.

## How the pieces fit

- **Skills** (`skills/*/SKILL.md`): one founder job each. Built on the shared scaffold
  (`skills/templates/skill-scaffold.md`) and ending with a non-coder copy-paste prompt.
- **Flows** (`flows/*.md`): multi-step workflows that chain skills with **CHECKPOINTS**.
- **Loops** (`loops/*.md`): recurring cadences the founder schedules (agent standup, weekly Share-of-Model review).
- **Agents** (`agents/*.md`): advisor personas to dispatch (devil's-advocate, safety-judge) for a specific lens.
- **Handbook** (`handbook/*.md`): the 14-chapter method, long-form, with named case studies.
- **Dictionary** (`dictionary/*.md`): the AI-native vocabulary; skills and chapters link into it.
- **Knowledge base** (`knowledge-base/`): the OS's growing memory; see below.

## Operating principles (enforce these in every interaction)

These override the urge to be merely agreeable. They live in `knowledge-base/PRINCIPLES.md`, which
you should treat as imported master context.

1. **Remove-the-AI test on every design.** Ask: does this break without the intelligence? If not,
   you are building a wrapper. Push the design toward a closed loop that learns from use.
2. **Architecture before code.** AI makes prototyping deceptively cheap; unstructured AI-generated
   code collapses under growth. Specify the system (`SYSTEM-INVENTORY`) before generating it.
3. **Research before asserting.** Verify checkable claims (market size, regulatory timelines,
   benchmarks) or label them assumptions. Never state a guess as fact; never invent numbers.
4. **A demo is not evidence.** A working prototype proves nothing about demand or clinical/operational
   safety. Name what still needs a human call and what still needs validation.
5. **Adversarial by default.** AI supercharges confirmation bias: when you ask it to justify your
   idea, it will. Make it try to *refute* you. Bake the devil's advocate into discovery.
6. **Human-on-the-loop in sensitive domains.** Agents execute; humans set goals and review outcomes.
   In health, food-safety, finance, or anything irreversible, require deterministic fallbacks.
7. **Stay theme-agnostic.** Use the placeholder glossary (`[ICP]`, `[PROBLEM]`, `[DOMAIN]`); never
   bake in a sector the founder didn't specify.

## The learning loop (how AI-Native OS gets smarter)

After any skill/flow produces a **real outcome** (an eval result, a customer reply, a Share-of-Model
move, a failed launch), invoke the `capture-learning` skill to append a dated, sourced lesson to
`knowledge-base/`. Append, never overwrite. The four KB files (`PRINCIPLES.md`,
`DOS-AND-DONTS.md`, `PLAYBOOK-LESSONS.md`, `MOATS-LEDGER.md`) are imported as context so the OS
stops repeating mistakes. Read them at the start of substantive work.

## Cross-platform note

The same `skills/` source serves Claude Code, Codex, Cursor, and Gemini CLI. Skills speak in
*actions* ("read the file", "dispatch an agent"), not one runtime's tool names. Per-platform
tool-name mapping: `docs/cross-platform-guide.md`. For non-coders, every skill ends with a
copy-paste prompt and the `prompts/` library indexes them, tagged by tool (Claude.ai, ChatGPT,
Lovable, Bolt, v0, Replit).

## Licensing and attribution (must be preserved)

Content (skills, prompts, handbook, dictionary, docs) is **CC-BY-4.0**; code/scripts are
**Apache-2.0**. Attribution is legally required: **AI-Native OS by Adam M. Adamek (Impact Brussels
ASBL)**. Keep the `attribution:` field in skill frontmatter intact. See `LICENSE-CONTENT`,
`LICENSE-CODE`, `ATTRIBUTION.md`.

## When adding to AI-Native OS

Use `skills/templates/skill-scaffold.md` and the authoring checklist there. Follow `CONTRIBUTING.md`.
Every new skill: scaffold-based body, a `references/` file with the real method, a copy-paste block,
theme-agnostic placeholders, a Dictionary cross-link, and an entry in `ROADMAP.md`. Author skills to
the bar in `writing-great-skills`: the `description` states **triggers only** (never a workflow
summary), the body is predictable, and heavy reference is disclosed to `references/`.
