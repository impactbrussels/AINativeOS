# Prompt - Secure the Connectors

**What it does:** maps every tool your agent can reach, scopes each to the minimum, and gates the irreversible ones behind a human, so a prompt injection that wins still cannot do harm.

**Stage:** Trust. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Gemini).

```
Act as a security reviewer hardening the tool and connector layer of my AI agent before it gets
access. Be strict and assume any document or input the agent reads may contain a hidden instruction.
My product: [ONE_LINER]. Domain: [DOMAIN]. The agent's job: [AGENT_TASK]. The connectors or tools I
plan to give it: [list each MCP server, API, file store, or action]. The thing that must never happen
without a human: [GUARDRAIL].
1. Build a connector-risk register: for each tool, what it can reach, whether its actions are
   reversible, and the blast radius if a poisoned input fires it.
2. Set least privilege: the minimum scope each tool needs, and WHERE that scope must be enforced.
   Flag every scope I am tempted to enforce only in the system prompt, and tell me why that fails
   against prompt injection.
3. List which tools are irreversible (pay, delete, send, deploy) and design the human-approval step
   for each, plus a cadence to re-audit the grants so access cannot quietly widen.
Assume the prompt will be overruled by an injected instruction; design so the damage is bounded
anyway. End with the single most over-scoped tool I should cut or gate today.
```

Full skill: [secure-the-connectors](../skills/secure-the-connectors/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
