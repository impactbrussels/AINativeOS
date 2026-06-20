# The AI-Native Build Arc: Stage Map

AI-Native OS is organised around the arc an AI-native company actually moves through. Find your
stage, run the skill in bold, read the matching Handbook chapter. Unsure? Run `start-here`.

```
Frame  →  Architect  →  Build  →  Trust  →  Ship  →  Grow  →  Defend
```

| Stage | The question it answers | Run this skill | Handbook |
|-------|-------------------------|----------------|----------|
| **Frame** | Is there a real, sharp bet here, and where's the terrain? | **`frame-the-hypothesis`**, then **`map-the-terrain`** | ch. 01–04 |
| **Architect** | What is the cognitive system, before any code? | **`architect-before-code`** | ch. 05 |
| **Build** | How do I build it with agents without it collapsing? | **`agentic-build-loop`** | ch. 06–07 |
| **Trust** | How do I make it safe enough to act on a human? | **`eval-and-safety-harness`** | ch. 08 |
| **Ship** | What's the smallest agent that proves the loop? | **`design-the-mva`** | ch. 09 |
| **Grow** | How do buyers find me and how do I know it's working? | **`measure-ai-native-pmf`** (+ `geo-content`*) | ch. 10–12 |
| **Defend** | What compounds, and what can't be copied? | `moat-strategy`* (+ `gateway-agent-ops`*) | ch. 13–14 |

\* On the [ROADMAP](../ROADMAP.md): shipping after the v0.1 slice.

## How the stages connect

- **Frame → Architect.** A validated hypothesis becomes the spec for the system. Don't architect a
  bet you haven't sharpened.
- **Architect → Build.** The `SYSTEM-INVENTORY` is the contract the agents build against. Architecture
  first, code second, always.
- **Build → Trust.** As soon as the system can act, it can act wrongly. Trust is not a final gate; it
  runs alongside the build in sensitive domains.
- **Trust → Ship.** A Minimum Viable Agent is the smallest thing that proves the intelligence loop
  works *and* survives its safety rubric.
- **Ship → Grow.** Real PMF (the 40% test) and Share of Model tell you whether to pour fuel on.
- **Grow → Defend.** Growth without a moat is a countdown. The data flywheel and trust assets are
  what make the lead durable.

The arc is not strictly linear: a failed eval (Trust) loops you back to Architect; a weak Share of
Model (Grow) can send you back to Frame. The `start-here` skill re-diagnoses whenever you're unsure.
