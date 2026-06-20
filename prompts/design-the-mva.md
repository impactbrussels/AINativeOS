# Prompt - Design the Minimum Viable Agent

**What it does:** scopes the smallest agent that proves your intelligence loop, instead of the feature pile that flatters you.

**Stage:** Ship. **Tool:** `chat` -> `build`.

> For non-coders: design it in a chatbot (Claude.ai, ChatGPT, Gemini), then hand the spec to a no-code builder (Lovable, Bolt, v0).

```
Act as my AI-native product coach. My idea: [ONE_LINER]. Who it's for: [ICP]. Domain: [DOMAIN].
Help me define my Minimum Viable Agent: the smallest agent that proves the loop, not a feature pile.

1. Pick the one Goldilocks task. It must pass all three tests at once: high-volume (runs often
   enough to save real time), guideline-based (a knowable right answer a human checks at a glance),
   and low-risk (a wrong answer is an annoyance, not a harm). If my instinct is my highest-value but
   highest-risk task, push back and tell me to take the safe job next to it first.
2. Name the loop it proves: task in, agent acts, outcome out, human accepts or corrects, the system
   records the choice. The deliverable is a working loop, not a screen.
3. State the ONE hypothesis it tests, so it can come back no: "users in role R, facing task T, accept
   the agent's output without redoing it at least M% of the time."
4. Add the fallback in one bounded sentence: retry N times, switch to a backup, then drop to a fixed
   non-AI path and escalate to a named human. No infinite loops.

If removing the AI leaves the loop still working, tell me I scoped a feature. Don't flatter me. End
with the ONE next action to build it.
```

Full skill: [design-the-mva](../skills/design-the-mva/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
