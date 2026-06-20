# Contributing to AI-Native OS

AI-Native OS is built to be built *with* you. Whether you're adding a skill, an entry to the
Dictionary, a case study to the Handbook, or fixing a typo: welcome. This guide keeps everything
feeling like one tool.

## The bar

Every contribution is held to the same standard the core is:

1. **Remove-the-AI test.** If you're adding a skill or example, ask whether it teaches building a
   *native* system (one that breaks without its intelligence) or just a wrapper. We want the former.
2. **Research before asserting.** Any checkable claim (market size, regulatory timeline, a company's
   numbers) is cited or labelled an assumption. Never invent figures. See `handbook/SOURCES.md`.
3. **Theme-agnostic.** Skills use the placeholder glossary; they never bake in a sector.
4. **Predictable skills.** Author to the `writing-great-skills` bar: the `description` states
   *triggers only* (never a workflow summary), and heavy reference is disclosed to `references/`.

## Adding a skill

1. Copy the gold-standard [`architect-before-code`](skills/architect-before-code/) skill folder.
2. Fill the [skill scaffold](skills/templates/skill-scaffold.md): frontmatter, the fixed body shape,
   a `references/` framework file, a `## Dictionary` cross-link, and a `## Copy-paste version`.
3. Add a Dictionary entry for any new term you introduce.
4. Add your skill to [ROADMAP.md](ROADMAP.md) (move it from "next" to "shipped").
5. Open a PR. Keep the `license:` and `attribution:` frontmatter intact.

## Adding a Dictionary entry

Follow the entry template in [dictionary/README.md](dictionary/README.md): definition → mechanics →
`_Avoid:_` → `_Usage:_` → cross-links. ~120–350 words. Opinionated and example-driven.

## Adding to the Handbook

Each chapter has a fixed shape (problem hook → core concepts → 2–3 named examples → AI workflows →
"Your turn" → Dictionary links → the skill it spawns). New case studies go in
`handbook/case-studies/` and **must** be added to `handbook/SOURCES.md` with provenance and a
verification status.

## Style

- Imperative for instructions ("Specify the system", "Name the failure mode").
- "Use when…" for skill triggers.
- Metaphor over jargon; problem-first openings.
- Banned buzzwords: *streamline, empower, leverage, transform, seamless, revolutionary, game-changing*.

## Licensing

By contributing, you agree your contribution is licensed under the repo's dual license (content
CC-BY-4.0, code Apache-2.0) and that attribution to **AI-Native OS by Adam M. Adamek (Impact
Brussels ASBL)** is preserved.
