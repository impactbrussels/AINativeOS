# Decisions (ADR Log)

Architecture and editorial decisions for *Load-Bearing* / AI-Native OS, banked during the
grill-with-docs session. Each is binding until superseded. Glossary of project-specific terms at the
foot.

---

## ADR-001. Evidence standard: web-check or it doesn't ship

Every company or figure used as a proof point must survive an independent web check. The five
companies that returned no credible source (Teeny AI, Motion Bloom, AgriBioVentures, Punica, LydiaRx)
are **dropped**, not labelled. We never fabricate, never invent a figure, never state a guess as
fact. Contested numbers are tagged `[claimed in source]` and logged in `handbook/SOURCES.md`, the
public transparency ledger. Real, first-hand examples beat researched ones.

## ADR-002: Voice and mechanics (applied repo-wide)

Adam M. Adamek's book voice. **Second person dominant** ("you", the founder); first person singular
("I") only for sparse, earned-authority asides; **no institutional "we."** **British spelling.**
**No em-dashes or en-dashes** in prose (unspaced en-dash for number ranges only). Purge the
banned-phrase list (see `VOICE-GUIDE.md`). Applied across the whole repo: Handbook, Dictionary,
skills, masterfiles, README, MANIFESTO. The Dictionary keeps its glossary *format*; only its
mechanics change.

## ADR-003. Structure: a16z thesis-first, no stories

Analytical, not narrative. No vignettes or story openers. Each chapter follows the fixed skeleton:
`Thesis box → The shift → The framework (numbered) → Why it holds (evidence) → In hard mode → What it
means for you → The test`. Tighten chapters to **~2,000–3,000 words**. Well-indexed and scannable.

## ADR-004. Spheres: 70% universal / 30% hard-mode anchor

The method is universal (works for any AI-native startup): that is the 70%, carried by The framework,
Why it holds, and What it means for you. The sector-specific 30% lives in a dedicated **"In hard
mode"** section per chapter, drawing on food, health, and deeptech (EFSA, clinical safety, hardware,
regulatory timelines).

## ADR-005: The spine thesis

> Building is no longer the moat. Everyone rents the same models; everyone ships a demo by Friday; a
> wrapper gets cloned in a weekend. What cannot be copied is intelligence that is **load-bearing**: a
> product that compounds proprietary data and earns trust the AI giants cannot reach. When everyone
> can build, **judgement becomes the scarce input**, and the founder becomes the **conductor**. In
> hard-mode sectors, **trust is the currency**: you turn promise into trust, trust into trial, trial
> into traction. **Proof before hype.**

Every chapter ladders to this.

## ADR-006: Title

**Load-Bearing: Building AI-Native Companies in Hard-Mode Sectors.** "Proof before hype" remains the
creed/refrain (it is already Adam's book title), not the handbook title.

## ADR-007: Visuals and brand

Sparing **Mermaid** diagrams, one per chapter maximum, only where a picture beats a sentence (build
arc, four-pillar architecture, data flywheel). Navy-led brand tokens applied via `classDef`:

| Token | Hex | Use |
|---|---|---|
| Navy (primary) | `#0A2540` | key nodes, the load-bearing piece |
| Blue (accent) | `#2F6FED` | active path, the flywheel arrow |
| Light fill | `#E8F0FE` | node backgrounds |
| Slate | `#64748B` | secondary edges/labels |

## ADR-008. Chapter close: "The test"

Each chapter ends with **"The test"**: one sharp self-diagnostic question the founder answers about
their own company, plus a one-line pointer to the skill that operationalizes the chapter. No
worksheets.

## ADR-009: The 14-chapter thesis ladder (locked)

Seven kept (01, 05, 07, 08, 09, 13, 14), four tightened to remove overlap (02, 03, 04, 06), three
deepened with Adam's own published frameworks: the **narrative-evidence gap** (ch 10), **pilot
purgatory** (ch 11), and **the second bite** (ch 12). Build arc order unchanged.

## ADR-010. Format: Markdown

All content is Markdown. Mermaid diagrams live in fenced ` ```mermaid ` blocks (GitHub renders them).
No TypeScript (this is a content + skills repo, not an app). Only optional code is a bash lint script.

## ADR-011: Sequencing

Rebuild the **Introduction + Chapter 05** as the gold-standard pair for sign-off before batch-building
the remaining 12 chapters. Minimise rebuild cycles.

---

## Glossary of project frameworks

Project-specific terms and Adam-originals used throughout (the Dictionary holds the technical terms):

- **Load-bearing intelligence**: intelligence the product cannot run without; the opposite of a wrapper.
- **The Remove-the-AI test**: delete the model call; what breaks, and does it belong to you?
- **The conductor**: the founder's role once building is cheap: decide what should exist and what must never ship.
- **Judgement as the scarce input**: when everyone can build, taste and decision become the bottleneck.
- **Trust is the currency**: in hard mode you win by turning promise into trust, trust into trial, trial into traction.
- **Proof before hype**: the creed: validate before you build, cite before you claim, a demo is not evidence.
- **The narrative-evidence gap**: the distance between the story you tell and the proof you can show; where trust dies.
- **Pilot purgatory**: a pilot is branded curiosity, not a contract; a signature is not revenue.
- **The second bite**: the first purchase measures curiosity, the fifth measures belief; trial is not habit.
- **The test**: each chapter's closing one-question self-diagnostic plus skill pointer.

---

*Decision log for AI-Native OS / Load-Bearing by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
