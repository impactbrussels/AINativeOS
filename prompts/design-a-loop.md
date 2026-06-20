# Prompt - Design a Loop

**What it does:** scopes a recurring agentic task into a loop with a trigger, a gate, a stop condition, and the cost-per-accepted-change metric that judges it.

**Stage:** Build. **Tool:** `chat` -> `build`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my loop engineer. I want to automate a recurring agentic task without it burning money
or shipping work I never checked.
Task: [AGENT_TASK]. Domain: [DOMAIN]. Cadence: [how often it repeats].
1. Run the 4-condition test on my task and tell me plainly if I should NOT build a loop:
   (a) does it repeat weekly or more? (b) can a test, lint, type check, or build fail the work
   without me watching? (c) can my budget absorb retries and re-reads? (d) does the agent have
   logs, a reproduction environment, and the ability to run its own code? If any fail, say so
   and stop.
2. If it passes, design the minimum viable loop: one trigger, one skill (the standing knowledge
   it rereads), one state file (what it records so it resumes instead of restarting), one gate.
3. Define the gate as an OBJECTIVE check, and put a SEPARATE checker on it, not the same agent
   that did the work.
4. Set the hard stop: max iterations, a time limit, a token ceiling, and a written stop condition.
5. For anything irreversible or safety-relevant ([GUARDRAIL]: a dose, an allergen, a filing, a
   payment), require human-on-the-loop and make the gate include the safety check, not just tests.
Output a loop spec table: trigger, skill, state file, gate, stop condition, escalation owner.
Then give me ONE metric to judge it: cost per accepted change. End with the single next action.
```

Full skill: [design-a-loop](../skills/design-a-loop/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
