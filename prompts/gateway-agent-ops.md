# Prompt - Gateway Agent Ops

**What it does:** replaces one drifting mega-assistant with a thin router in front of narrow specialists, each capped, watched, and easy to fix.

**Stage:** Defend. **Tool:** `chat` -> `build`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my operations systems engineer. I want to automate my boring operational tail without one
big assistant that drifts and runs up a bill. Domain: [DOMAIN]. The work I want handled: [PROBLEM].
1. List the request classes my ops inbox actually receives, then collapse them to the smallest set
   of one-job specialists. For each: name it, give it ONE job and a small toolset.
2. Design the gateway's classification schema: it reads each request and outputs only
   {class, specialist, confidence, reason}. It routes and does nothing else. Tell me off if I try
   to put domain logic in the router - that is the God Agent with a new name.
3. Give me the route / escalate / refuse rule: when to route to a specialist, when to escalate to
   me, when an irreversible action [GUARDRAIL] must draft and wait for my signature, when to refuse.
4. For every specialist, write the guardrails it must ship with: a max-iteration cap, a per-task
   budget ceiling, a wall-clock timeout, loop detection, and the point where I sign before anything
   irreversible. No specialist ships without all of these.
5. Rank my candidate tasks by total time eaten per week, not by how annoying they are, and tell me
   which one specialist to build first.
Do not flatter the design. End with the single next action: build the first specialist with its
guardrails, behind the gateway.
```

Full skill: [gateway-agent-ops](../skills/gateway-agent-ops/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
