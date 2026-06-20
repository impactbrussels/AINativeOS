# Stage Diagnosis: The Build-Arc Map

The full routing method. Place a founder on the build arc, run the Remove-the-AI test, and hand back
exactly one next skill. Diagnose by what they cannot yet answer, never by what excites them. The point
of this file is to stop the two failures that waste months: building the wrong thing for the stage, and
building a feature that survives having its AI removed.

## The build arc

```
Frame  →  Architect  →  Build  →  Trust  →  Ship  →  Grow  →  Defend
```

Each stage answers one question. A founder is at the earliest stage whose question they cannot answer
with evidence, not with a slide.

| Stage | The question it answers | Done when |
|-------|-------------------------|-----------|
| **Frame** | Is there a real, sharp, falsifiable bet, and where is the terrain? | You can state the riskiest assumption and the pass/fail bar that settles it. |
| **Architect** | What is the cognitive system, before any code? | The System Inventory and the one closed loop are written down. |
| **Build** | How do I build it with agents without it collapsing? | Agents build against the inventory, debt is paid down as you go. |
| **Trust** | How is it safe enough to act on a human? | The eval suite and the human-on-the-loop gates pass. |
| **Ship** | What is the smallest agent that proves the loop? | A Minimum Viable Agent runs the loop end to end. |
| **Grow** | How do buyers find me, and is it actually working? | Real PMF and Share of Model say whether to pour fuel on. |
| **Defend** | What compounds, and what cannot be copied? | The data flywheel and trust assets make the lead durable. |

## The Remove-the-AI test in full

Run this first, on every diagnosis, before you route. Strip every model call out of the product in
your head. Now ask three questions in order.

1. **Does the core job still get done?** If yes, you built an AI feature, not an AI-native company.
   The intelligence is decoration.
2. **Does anything of value remain?** A wrapper can still be useful. Useful and defensible are
   different words. Note which it is.
3. **What compounds with use?** Name the one signal each interaction leaves behind that makes next
   month's product sharper. No signal, no flywheel, no moat.

The verdict is binary and it outranks everything: **native** (collapses without intelligence and
compounds) or **wrapper** (survives removal, or survives but compounds nothing). A wrapper diagnosed in
week one saves a year. Do not soften it to be encouraging.

## Symptom to stage to next skill

Route on the founder's own words. The left column is what they say; the right column is the single skill.

| What the founder says | Stage | Run next |
|-----------------------|-------|----------|
| "Is this worth building?" / "I have an idea" / building on a hunch | Frame | `frame-the-hypothesis` |
| "Who are my competitors?" / "What is the regulatory path?" / "Where is the wedge?" | Frame | `map-the-terrain` |
| "I keep guessing what users want" / "my interviews all say yes" | Frame | `customer-discovery-that-doesnt-lie` |
| "What is the architecture?" / "should I just prototype this?" / "the codebase is a mess" | Architect | `architect-before-code` |
| "Is this actually AI-native?" / "audit my architecture" / "the agent does everything" | Architect | `cognitive-architecture-review` |
| "How do I build with agents without it collapsing?" | Build | `agentic-build-loop` |
| "Is it safe enough to act on a human?" / health, food-safety, finance, anything irreversible | Trust | `eval-and-safety-harness` |
| "What is the smallest version that proves the loop?" | Ship | `design-the-mva` |
| "Is it actually working?" / "do I have product-market fit?" | Grow | `measure-ai-native-pmf` |

When two stages fit, send them upstream. The highest-value work is the riskiest unvalidated belief, not
the one with the cleanest demo. A founder excited to architect a bet they have not sharpened goes to
Frame, not Architect.

## Worked diagnosis

A founder says: "I have built a tool that drafts regulatory dossiers for food startups. The demo
writes a clean first draft. What is my next step, should I add a billing page?"

- **Remove-the-AI test.** Strip the model: an empty template remains. The core job, drafting, does not
  happen without intelligence, so this is not a plain feature. But trace the compounding question:
  nothing is captured. Each dossier is drafted from the prompt alone; yesterday's corrections and the
  outcomes of filed dossiers are thrown away. So it is an AI-native-shaped wrapper. It needs the AI and
  builds no moat.
- **Stage.** They are asking about billing (a Ship or Grow concern), but they cannot answer the Frame
  question underneath it: is the riskiest assumption tested? The riskiest belief is that a startup will
  trust a machine-drafted dossier enough to file it. That is unproven. They are at **Frame**, not Ship.
- **Route.** One skill: `frame-the-hypothesis`. Reason in one line: the demo proves the draft compiles,
  not that anyone will file it; sharpen and test that bet before a billing page.
- **What not to say.** Not "add billing, then run GEO, then design the MVA, and also audit your
  architecture." That is five skills, which is the same as none.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| The buffet | Routing to five skills "to be thorough". A list of five is no answer; the founder freezes. | Name exactly one skill and one reason. Park the rest. |
| Skipping the test | Diagnosing the stage but not running the Remove-the-AI test, to stay encouraging. | Always run the test first. A wrapper found early is the cheapest finding there is. |
| Chasing the exciting work | Routing to the shiny build because the founder is keen, when the riskiest belief sits upstream untested. | Route to the earliest unvalidated assumption, even when it is the dull one. |
| Trusting the demo | Treating a clean demo as evidence of the stage. The demo runs on the happy path with the founder steering. | Diagnose by what they cannot answer with evidence, not by what the demo shows. |
| Routing on the literal question | Founder asks about billing, so you route to Ship, missing the untested Frame bet beneath it. | Find the riskiest belief under the question, then route to its stage. |

## Copyable template

```
START-HERE DIAGNOSIS: [PRODUCT]
Idea: [ONE_LINER]   For: [ICP]   Domain: [DOMAIN]

REMOVE-THE-AI TEST
  Strip every model call. Core job still done?  yes / no
  Anything of value remains?  ________________________________
  What compounds with use?  ___________________________________
  VERDICT:  native / wrapper   (wrapper = survives removal OR compounds nothing)

STAGE (earliest question they CANNOT answer with evidence)
  [ ] Frame  [ ] Architect  [ ] Build  [ ] Trust  [ ] Ship  [ ] Grow  [ ] Defend
  Riskiest unvalidated belief: ________________________________

THE ONE NEXT SKILL: ______________________   (exactly one)
  Reason in one line: ______________________________________
```
