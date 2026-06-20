# The Master File: Anatomy

The full framework for the persistent-memory master file. The agent is stateless: it remembers
nothing between sessions and little across a long one. Each time it opens the repo it rebuilds a
theory of how the system fits together, then builds against that theory. The master file replaces the
guess with your written architecture, so the theory is yours and the same on Monday as on Friday. A
clever prompt performs once and is gone when the context window clears. The file is a memory.

## What belongs, and what does not

The file is load-bearing only while it is short and true. Every line that goes stale poisons every
session that reads it. Be ruthless about what earns a place.

| Belongs in the file | Does not belong |
|---------------------|-----------------|
| Standing context an agent would otherwise guess wrong | A changelog of every commit (git already has it) |
| The four pillars and the one closed loop | Secrets, API keys, tokens |
| Rules specific to this codebase | Generic best practice the model already knows |
| Constraints a newcomer breaks by accident | Anything a linter, type-checker, or test enforces |
| Dated decisions and their trade-offs | Decisions already reversed (prune on sight) |
| Pointers to the glossary | Full definitions that drift from their source |

Rule of thumb: if a fact is enforced elsewhere (a test, a linter, the type system), do not restate it
here. The file holds what only a human knows and would otherwise have to re-explain every session.

## The seven sections

1. **What this is.** One paragraph. The product and the one sentence of its closed loop. An agent that
   reads this stops inventing a parallel product.
2. **System inventory.** The four pillars named for this product: Brain (which model reasons, which
   fallback), Memory (retrieval, store, this file), Planning (how it decides before acting), Tools
   (which actions reach the world and their blast radius).
3. **Principles.** The non-negotiable rules of this codebase, the ones that override the urge to be
   merely agreeable. Numbered, so they index.
4. **Constraints.** The limits a newcomer would break by accident: the budget, the regulated path, the
   deterministic fallback, the thing that must never be auto-sent.
5. **Decisions.** Dated trade-offs, newest first. Each line: the date, the decision, the reason in
   half a sentence. This is the section the update ritual feeds.
6. **Glossary pointers.** Links to the domain terms, not the definitions. Definitions live once, at
   source, and drift if copied.
7. **Update ritual.** The one-line rule that keeps the file alive, stated inside the file so no one
   can claim they did not know.

## The update cadence

| When | Do this |
|------|---------|
| Repo created | Write the file before the first feature. Architecture first, code second. |
| Start of every session | Read the file top to bottom. It is the first input, not a reference. |
| End of every session | Add one dated line to Decisions naming the trade-off you just made. |
| Any behaviour-changing model or prompt edit | Treat it as a decision (CACE): record it, do not commit it silently. |
| Monthly | Prune reversed decisions and stale constraints. A short true file beats a long one. |

## Worked before-and-after

**Before (no master file).** A founder builds a peptide-screening tool with an agent. Monday's session
sets up retrieval over a proprietary assay dataset. Tuesday, a fresh session opens the repo, sees no
record of why retrieval exists, and "simplifies" it into a direct model call to make a test pass. The
grounding is gone. The tool now improvises answers a lab would act on. Nobody decided this; the agent
guessed, because the reason was only ever in Monday's chat, which had cleared.

**After (with the master file).** The same repo now carries `CLAUDE.md`:

```
## System inventory
- Memory: retrieval over the validated assay dataset GROUNDS every screening answer.
  This is the moat. Do not replace with a direct model call.

## Decisions
- 2026-06-19: Grounded screening on the assay dataset, not the raw model. A wrong peptide
  call is a wasted synthesis run, not a screenshot. Retrieval stays even if a test is easier without it.
```

Tuesday's session reads this first, sees the reason, and routes its fix around the grounding instead
of through it. The trade-off survived the context window because it was written down. One line saved a
silent regression that would have surfaced weeks later, in the lab, against a deadline.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| The stale file | Written once at repo creation, never updated. Now it confidently describes a system that no longer exists, and every session trusts the lie. | The session-end ritual: one dated line, every session. A file with no update history is presumed stale. |
| Dump everything | The file is a wall of every detail, including what the linter enforces and what git already records. The agent cannot find the load-bearing lines in the noise. | Cut to the seven sections. If it is enforced elsewhere or lives in git, delete it. |
| No update ritual | Good intentions, no mechanism. The file decays the moment the founder gets busy. | State the ritual inside the file (section 7) and make adding the line the last step of every session. |
| Single-platform | Only `CLAUDE.md` exists, but the team also runs Codex and Cursor, which read different files and so obey older or no rules. | Mirror the content to `AGENTS.md`, `GEMINI.md`, and `.cursor/rules/*.mdc`. Keep them identical; a contradiction is worse than nothing. |
| Copied definitions | The glossary is pasted in full and now disagrees with the source dictionary. | Link, do not copy. Point to the term; let it live once. |

## Copyable template

```markdown
# [PROJECT]: Master Context

> Read this top to bottom at the start of every session. It is the first input, not a reference.
> Claude Code reads CLAUDE.md; Codex reads AGENTS.md; Gemini reads GEMINI.md;
> Cursor reads .cursor/rules/[project].mdc. Keep all four identical.

## What this is
[ONE_LINER]. The closed loop: [INTELLIGENCE_LOOP].

## System inventory (the four pillars)
- Brain: [model that reasons] / fallback: [cheaper or deterministic route]
- Memory: [retrieval + store + this file]
- Planning: [how it decides before acting; where a human approves]
- Tools: [actions that reach the world + each blast radius]

## Principles (non-negotiable)
1. [Rule specific to this codebase]
2. [Rule specific to this codebase]

## Constraints (a newcomer breaks these by accident)
- [CONSTRAINT]
- [GUARDRAIL: the answer that must never be auto-sent / the deterministic fallback]

## Decisions (newest first)
- [DATE]: [decision]. Reason: [half a sentence].

## Glossary pointers
- [term] -> [link to source], [term] -> [link to source]

## Update ritual
At the end of every session, add ONE dated line to Decisions naming the trade-off just made.
```
