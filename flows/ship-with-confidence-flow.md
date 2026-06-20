---
name: ship-with-confidence-flow
description: Use when a founder is building and shipping an AI product in a sensitive or regulated domain and must not let the demo-to-reality gap or an unsafe agent through - when they say "how do I ship this safely", "we're going live", or are moving from build to launch. Chains agentic-build-loop, eval-and-safety-harness, measure-ai-native-pmf with checkpoints.
stage: build
function: flow
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# Ship With Confidence Flow

The dangerous gap is between the demo and reality. A demo runs once, on a clean input, in front of a
friendly audience. Reality runs a thousand times, on the input you never imagined, in front of a
user who trusts the answer. In a sensitive domain, that gap is where someone gets a wrong dose, a
mislabelled allergen, or a financial figure they act on. This flow closes it. Three skills, in
order, each gated by a checkpoint, taking you from a working build to a launch you can defend.

This flow assumes the architecture exists and the MVA is scoped. If it is not, run idea-to-mva-flow
first. Here the job is to build it well, prove it is safe, and confirm it is actually wanted.

## The sequence

### Step 1 - Build it without it collapsing (skill: agentic-build-loop)
Agents write most of the code now, which makes speed cheap and rot cheap too. The skill runs the
build as specs and tests over syntax: the System Inventory is the contract, the tests are the proof,
and agentic technical debt is paid down as you go rather than left to compound. You ship code you
can reason about, not a pile that ran once.

**Produces:** a working build against the spec, a test suite the agents must keep green, and a debt
ledger of what was deferred and why.

**CHECKPOINT 1.** Does the build match the System Inventory, or has it quietly drifted? Run the
tests and read the debt ledger. If the agents have invented scope the architecture never sanctioned,
cut it back before it becomes load-bearing. A build that passes its own tests but answers a
different spec is not done. Do not proceed to safety on a build you no longer fully understand.

### Step 2 - Prove it is safe (skill: eval-and-safety-harness)
A working agent that can act on a human can act wrongly on a human. The skill builds the eval and
safety harness: a rubric every high-stakes output must pass, a critic and a separate judge, sourced
claims, flagged uncertainty, a confidence threshold below which the agent refuses, and a
deterministic fallback for the irreversible path. This is human-on-the-loop made concrete.

**Produces:** an eval rubric, a critic/judge harness, refusal and fallback behaviour, and a pass
rate on a held-out set you did not tune against.

**CHECKPOINT 2.** Dispatch the safety-judge agent against the rubric. Would an unsourced clinical or
safety claim reach a user? Does the deterministic fallback exist and fire on the high-stakes path?
If any irreversible action can run without a human able to stop it, you are not ready to go live.
A failed eval loops you back to the build, or to the architecture. Do not let a launch date override
a red result.

### Step 3 - Confirm it is wanted (skill: measure-ai-native-pmf)
Safe and unwanted is a slow failure. The skill measures real product-market fit, not vanity:
the 40% test, retention on the closed loop, and Share of Model, which tells you whether buyers reach
you through the AI surfaces that now mediate discovery. You learn whether to pour fuel on or hold.

**Produces:** a PMF signal grounded in real use, a retention read on the closed loop, and a Share of
Model baseline.

**CHECKPOINT 3.** Is the signal real demand or a launch-week spike? Separate the users who came back
from the users who tried it once. If PMF is weak, a strong eval does not save you; loop back toward
the bet rather than scaling a product the market is not pulling. If the signal holds, you have earned
the right to grow.

## What the flow outputs

- **A build that matches its spec**, with a green test suite and an honest debt ledger.
- **A safety harness** with a rubric, a separate judge, refusal behaviour, and a deterministic
  fallback on every irreversible path.
- **A real PMF read**: the 40% test, retention on the loop, and a Share of Model baseline.

The discipline running through all three steps is the same: proof before hype, and a demo is not
evidence. When the launch produces its first real outcome, a customer reply, a refusal that fired,
a Share of Model move, run the `capture-learning` skill so the lesson lands in the knowledge base
dated and sourced. You ship once with confidence; you ship better every time after.
