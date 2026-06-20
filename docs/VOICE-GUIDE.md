# Voice Guide: *Load-Bearing* / AI-Native OS

> Every word published here carries Adam M. Adamek's name. This guide keeps the Handbook, Dictionary,
> skills, and prompts in one voice: the analytical clarity of an a16z essay, carried in Adam's
> book voice. It is binding. Decisions behind it: `DECISIONS.md`.

## The voice in one line

**a16z's approach, Adam's voice.** Thesis-first and analytical like an a16z essay; precise,
evidence-first, anti-hype, and British like Adam's books; clear and concrete like Harry Dry. No
stories. No fluff. Earned authority, not pontificating.

## Person

- **Second person dominant.** Write to "you," the founder. It is direct and it is useful.
- **First person singular, sparingly.** Reserve "I" for rare, earned-authority asides only.
- **No "we."** Institutional "we" reads corporate and dilutes the authorship.

## The spine (everything ladders to this)

> Building is no longer the moat. Everyone rents the same models; everyone ships a demo by Friday; a
> wrapper gets cloned in a weekend. What cannot be copied is intelligence that is **load-bearing**: a
> product that compounds proprietary data and earns trust the AI giants cannot reach. When everyone
> can build, **judgement becomes the scarce input**, and the founder becomes the **conductor**. In
> hard-mode sectors, **trust is the currency**: promise into trust, trust into trial, trial into
> traction. **Proof before hype.**

## The chapter skeleton (every chapter, ~2,000–3,000 words)

```text
# NN. Title

> Thesis. The one bold claim, 1–2 sentences. The reader gets the argument in five seconds.

## The shift            Open cold on the structural fact. What changed, why the old way fails. No story.
## The framework        3–5 NUMBERED principles. Each: bold name + 1–2 sentences of mechanism. The indexable core.
## Why it holds          Verified company proof points stated as fact + tables; ≤1 Mermaid diagram if it earns its place.
## In hard mode          The 30% sector anchor: how this plays in food / health / deeptech.
## What it means for you  Direct, second person; 3–5 concrete moves.
## The test              One self-diagnostic question + → skill pointer.
```

**No stories, no vignettes, no "imagine a founder on a Tuesday."** Open on the thesis or the fact.
The framework is numbered so it indexes. Evidence comes after the claim, never before it.

## Structure rules (a16z)

- **Front-load the takeaway.** Thesis box at the very top, every chapter.
- **State the claim, then prove it.** Data, named company (verified), or named mechanism, in that
  order. Never bury the point under set-up.
- **Number the framework.** Principles are a numbered list with bold names. This is what "well-indexed"
  means in practice.
- **Tables and diagrams do real work.** Use a comparison table where prose would ramble. Use one
  Mermaid diagram per chapter at most, only where a picture beats a sentence. Navy brand tokens
  (`#0A2540` primary, `#2F6FED` accent, `#E8F0FE` fill, `#64748B` slate).

## Sentence mechanics (Harry Dry clarity + Adam weight)

- **Short and concrete by default.** Vary length hard; a long sentence must have visible internal
  structure. Uniform rhythm reads generated.
- **Strong verbs, few qualifiers.** Cut "essentially," "arguably," "sort of."
- **One idea per paragraph.** Short paragraphs. The occasional one-sentence paragraph for weight.
- **Concrete noun before abstract conclusion.** Plain word before technical word.
- **One load-bearing metaphor per chapter**, developed, never scattered (load-bearing, the conductor,
  the flywheel, the second bite).

## Write so it does not read as AI (anti-monotony)

Monotony is the tell. Even rhythm, repeated structures, and relentless symmetry are what make
competent prose feel machine-made. Break them on purpose.

- **Burstiness.** Vary sentence length hard. Put a three-word sentence next to a thirty-word one.
  Read each paragraph aloud; if the lengths are even, something is wrong. A short sentence after two
  long ones lands like a punch.
- **Ration the inversions.** "It is not X, it is Y" and "X, not Y" are strong once and a tic by the
  third time. One per section, at most. Same with the rule-of-three list; do not end every point on a
  tricolon.
- **Vary the paragraph.** Some paragraphs argue, some state a fact and stop. Some run six sentences,
  some run one. Never let every paragraph follow claim-then-reframe.
- **Vary the openings.** Do not start three sentences or paragraphs the same way. Retire the crutches:
  "So," "Now," "Here is," "Look at," "The thing is."
- **Break symmetry.** Perfect parallelism reads generated. Let a sentence run lopsided; let one clause
  be longer than its partner.
- **Anchor with specifics.** A real number, a named company, a concrete object lowers the machine
  signal more than any adjective. Prefer "a 28-month dossier" to "a long approval process."
- **Leave texture.** A fragment. A dry aside. A sharper verb than the safe one. Do not sand every edge
  smooth; smoothness is the giveaway.

The read-aloud test: if a paragraph could have been written by any competent writer, it is not yet
yours. Roughen it until it sounds like a person with opinions and a deadline.

## Mechanics (non-negotiable)

- **British spelling.** colour, behaviour, optimise, realise, organise, centre, defence, programme,
  analyse, modelling, judgement. (Product names stay branded: *Cursor*, *Codex*.)
- **No em-dashes or en-dashes in prose.** Commas, full stops, colons; or split the sentence. Unspaced
  en-dash for number ranges only (2026–2035). Chapter headings use "NN. Title" (a full stop, no dash).
- **Bold** for key phrases and takeaways. *Italics* rarely. No ALL CAPS for emphasis.

## Evidence discipline (the anti-hype engine)

- Numbers are **exact**, never "significant." A proof point must **survive a web check** or it does
  not ship (ADR-001). Contested figures carry `[claimed in source]` and live in `handbook/SOURCES.md`.
- Never state a guess as fact. Never fabricate a company, a figure, or a quote. A demo is not
  evidence, and that applies to your own prose.

## The spheres: 70 / 30

The method is universal (70%): The framework, Why it holds, and What it means for you do not assume a
sector. The hard-mode 30% lives in the **"In hard mode"** section, drawn from food, health, and
deeptech: EFSA and Novel Foods timelines, clinical validation, food safety, hardware, the
verification deficit.

## Banned phrases (purge on sight)

in today's fast-paced world · at the end of the day · it is important/worth noting · in conclusion ·
this underscores the importance of · leverage (as a verb) · unlock the power of · delve into ·
navigate the landscape · game-changer · rapidly evolving · seamlessly · robust · tapestry ·
ever-changing · think outside the box · paradigm shift · the key takeaway is · importantly (as
opener) · at its core · needless to say · as we move forward · in the context of · the future of ·
this begs the question · more importantly · without a doubt · there is no denying that · furthermore ·
moreover · certainly · absolutely · streamline · empower · synergy · holistic · revolutionary ·
cutting-edge · transform (as the verb of choice).

## The two-line test before publishing a section

1. Could this sentence sit in any vendor's blog post? If yes, rewrite it with a number, a verified
   company, or a named mechanism.
2. Did the section state its claim first and prove it second? If the evidence comes before the claim,
   reorder it.

---

*Voice guide for AI-Native OS / Load-Bearing by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
