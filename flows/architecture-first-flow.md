---
name: architecture-first-flow
description: Use when a founder wants the design-before-code path - to specify, audit, and document a cognitive system before a single agent writes against it, not after. Reach for it when they say "design it before I build it", "is this architecture sound", "I keep bolting things on", or are tempted to generate the system and fix it later. Chains frame-the-hypothesis, map-the-terrain, architect-before-code, cognitive-architecture-review, write-the-claude-md with checkpoints.
stage: architect
function: flow
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# Architecture First Flow

AI made the prototype cheap and the architecture expensive to skip. You can generate a system that
runs by Friday and discover by Q3 that nothing about it compounds, that memory was bolted on, that
one agent quietly does everything, and that a rival cloned the demo over a weekend. This flow puts
the design before the code. Five skills, in order, each gated by a checkpoint, taking you from a
sharp bet to a specified system that an agent can build against without inventing scope or rotting
under growth.

This is the slower path on the clock and the faster path to a company. Do not skip a step because
the next one looks like the real work. The architecture is the real work. The code is downstream of
it.

## The sequence

### Step 1 - Sharpen the bet (skill: frame-the-hypothesis)
You cannot architect a wish. Turn the idea into one falsifiable hypothesis: a named buyer, a
specific pain, and the load-bearing belief that, if false, ends the thing. The skill forces the bet
into a shape that can be proven wrong and isolates the riskiest assumption in it.

**Produces:** a single written hypothesis, the riskiest assumption named, and a disproving test you
could run this week.

**CHECKPOINT 1.** Read the hypothesis cold. Can it fail? If it cannot, it is a wish, and there is
nothing to architect. Confirm the riskiest assumption is the one you most fear being wrong about,
not the one easiest to defend. Run it through the devils-advocate agent before you move on.

### Step 2 - Map the terrain (skill: map-the-terrain)
A sound architecture built on the wrong terrain is a sound way to ship something you cannot legally
sell. Map the market, the wedge, and the regulatory clock. In hard-mode sectors that clock is a
binding input to the design: an EFSA Novel Foods file runs to months, a clinical claim needs
evidence before the agent is allowed to assert it. The constraints you find here become constraints
the system must carry.

**Produces:** a regulation-aware terrain map, the wedge stated plainly, and the constraints the
architecture must respect.

**CHECKPOINT 2.** Name the single constraint most likely to break the design and confirm the
architecture can carry it before you draw it. If the terrain makes the bet unviable, loop back to
frame-the-hypothesis. Do not architect a system you cannot ship.

### Step 3 - Specify the system (skill: architect-before-code)
Now design the cognitive system, on paper, before code. The skill produces a System Inventory: the
Brain, the Memory, the Planning, and the Tools, each named with its job and its blast radius. It
names the closed loop, the line where the product learns from its own use and breaks without the
intelligence. That loop is the answer to the Remove-the-AI test, and it is what you are about to
audit.

**Produces:** a System Inventory across the four pillars and a named closed loop the build will
target.

**CHECKPOINT 3.** Is every pillar specified, not implied? Is the closed loop written as one
sentence, use to proprietary data to a sharper product? If Memory is "the context window" or one
agent carries all four pillars, the design is not ready for an audit. Fill the gap before Step 4.

### Step 4 - Audit the design (skill: cognitive-architecture-review)
A System Inventory you wrote yourself flatters you. The review grades each pillar 0 to 3 against the
rubric, names the single weakest link, traces the closed loop or proves there is not one, and runs
the Remove-the-AI test on the whole design. This is where a wrapper dressed as a company gets caught,
on paper, before the build makes the mistake permanent.

**Produces:** a four-pillar scorecard with evidence, the weakest link named, a severity-by-effort
fix list, and a one-line AI-native or wrapper verdict.

**CHECKPOINT 4.** Read the verdict, not the average. If the system survives having its AI removed,
you specified a feature, and you loop back to architect-before-code to redesign toward a loop that
compounds. A flattering pillar average does not overrule a wrapper verdict. Fix the load-bearing
pillar with the worst score before you document anything.

### Step 5 - Write the persistent memory (skill: write-the-claude-md)
An audited architecture that lives only in your head is lost the moment an agent starts generating.
The skill authors the repo's master file, the CLAUDE.md that every agent reads as standing
instruction: the System Inventory as the contract, the closed loop, the guardrails on the
irreversible tools, the conventions the build must hold. This is the architecture made durable, so
the agents build the system you designed, not the one they drifted into.

**Produces:** a maintained CLAUDE.md (and its cross-platform mirrors) carrying the inventory, the
loop, the constraints, and the guardrails as persistent context.

**CHECKPOINT 5.** Hand the CLAUDE.md to a fresh agent with no other context. Can it state the closed
loop, the four pillars, and the one irreversible action that needs a human? If it cannot, the file
is not yet load-bearing and the build will drift. Tighten it until a cold agent reasons correctly
from it alone. Then build.

## What the flow outputs

- **A validated bet** you are willing to be proven wrong on.
- **A regulation-aware terrain map** with the binding constraint named.
- **A System Inventory** across Brain, Memory, Planning, and Tools, with a named closed loop.
- **An architecture audit**: a four-pillar scorecard, the weakest link, a fix list, and a verdict
  that the system collapses without its intelligence.
- **A CLAUDE.md** that carries all of it as persistent context, ready for an agent to build against.

You now have a system ready to build, not a system already half-built and quietly wrong. Hand it to
the ship-with-confidence-flow when the agents start writing. When the first build outcome lands, a
passing test, a drifted agent caught, a pillar that proved weaker than its grade, run the
`capture-learning` skill so the lesson lands in the knowledge base dated and sourced. You design
once with rigour; you design faster every time after.
