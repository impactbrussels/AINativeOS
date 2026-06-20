---
name: idea-to-mva-flow
description: Use when a founder has a raw AI idea and wants to reach a shipped Minimum Viable Agent without skipping the architecture - when they say "take me from idea to build", "what's the path", or are tempted to start coding on a hunch. Chains frame-the-hypothesis, map-the-terrain, architect-before-code, design-the-mva with checkpoints.
stage: frame
function: flow
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# Idea to MVA Flow

A raw idea feels like progress. It is not. The temptation, now that AI makes a prototype cheap, is
to open an editor on a Tuesday and have something that runs by Friday. That something is almost
always a wrapper built on an unexamined bet. This flow holds you back from the keyboard until the
bet is sharp, the terrain is mapped, and the system is specified. Four skills, in order, each gated
by a checkpoint where you stop and decide before any work compounds on top of a weak foundation.

Run the steps in sequence. Do not skip ahead because a later step looks more exciting. The earliest,
dullest work is the highest-value work.

## The sequence

### Step 1 - Sharpen the bet (skill: frame-the-hypothesis)
Turn the vague idea into one falsifiable hypothesis: a named buyer, a specific pain, and the
load-bearing belief that, if false, kills the whole thing. The skill forces the bet into a form
that can be proven wrong, then names the cheapest test for the riskiest part of it.

**Produces:** a single written hypothesis, the riskiest assumption isolated, and a disproving test
you could run this week.

**CHECKPOINT 1.** Read the hypothesis cold. Can it be wrong? If it cannot fail, it is a wish, not a
bet, and you have nothing to architect. Ask whether the riskiest assumption is genuinely the one
you fear most or the one you find easiest to defend. If you are not yet willing to spend a week
testing it, do not proceed. Send it through the devils-advocate agent before you move on.

### Step 2 - Map the terrain (skill: map-the-terrain)
A sharp bet still dies on regulation, on an incumbent, or on a buyer who cannot act. This step maps
the market, the competitive wedge, and the regulatory clock. In hard-mode sectors that clock is the
constraint that decides the build: an EFSA Novel Foods file runs to months, a clinical claim needs
evidence before it ships. You design around the timeline or the timeline ends you.

**Produces:** a regulation-aware terrain map, the wedge stated plainly, and the constraints the
architecture must respect.

**CHECKPOINT 2.** Does the wedge survive contact with the incumbent and the regulator? Name the one
constraint most likely to break the plan and confirm the architecture can carry it. If the terrain
makes the bet from Step 1 unviable, loop back to frame-the-hypothesis rather than architecting a
system you cannot legally or commercially ship.

### Step 3 - Specify the system (skill: architect-before-code)
Now, and only now, design the cognitive system. The skill produces a System Inventory: the Brain,
the Memory, the Planning, and the Tools, mapped before a line of code exists. It names the closed
loop, the place where the product learns from its own use and breaks without the intelligence. That
loop is the answer to the Remove-the-AI test. No closed loop, no AI-native company.

**Produces:** a System Inventory and a named closed loop the agents will build against.

**CHECKPOINT 3.** Apply the Remove-the-AI test to the inventory itself. Take the intelligence out:
does the system still work? If yes, you have specified a wrapper, and you must redesign toward a
loop that compounds proprietary data. Confirm the closed loop is named, not implied.

### Step 4 - Scope the agent (skill: design-the-mva)
Scope the Minimum Viable Agent: the smallest agent that proves the closed loop, and nothing more.
Not a feature pile, not a roadmap in disguise. One loop, end to end, doing real work for a real
user. The skill cuts everything that does not test the load-bearing belief.

**Produces:** a scoped MVA, the success signal it must hit, and an explicit cut list of what you are
not building yet.

**CHECKPOINT 4.** Does the MVA prove the bet from Step 1, or merely demonstrate the technology? If
it would impress in a demo but tell you nothing about demand or safety, you have scoped a toy.
Confirm the success signal is a real-world outcome, not a working screen. Then build.

## What the flow outputs

- **A validated bet** you are willing to be proven wrong on.
- **A regulation-aware terrain map** with the binding constraint named.
- **A System Inventory** with a named closed loop that passes the Remove-the-AI test.
- **A scoped MVA** that proves the loop, with its success signal and cut list.

A note on closing the loop. The MVA is built to produce a real result: a customer reply, an eval
score, a refusal, a sale. The moment it does, run the `capture-learning` skill so the outcome lands
in the knowledge base as a dated, sourced lesson. The flow gets you to a shipped agent; the learning
loop is how the next bet starts sharper than this one did.
