# Prompt - Agentic Build Loop

**What it does:** turns vibe-coding into a spec-and-test loop, so the agent builds the right thing instead of building the wrong thing fluently.

**Stage:** Build. **Tool:** `chat` -> `build`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my build conductor. My feature in one line: [ONE_LINER]. Domain: [DOMAIN]. Who uses it: [ICP].
Do not write any logic yet. Instead:
1. Turn my one line into a short spec: what the feature must do, and the inputs and outputs.
2. Write 2 acceptance tests in plain language - the pass/fail checks that decide it is done. These are
   the contract you build to.
3. Propose the framework before the logic: the screens or modules, their boundaries, and how they
   connect. Show me the skeleton, empty of detail, and wait for my approval.
Then stop and give me ONE next action to take once I have approved the frame.
```

Full skill: [agentic-build-loop](../skills/agentic-build-loop/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
