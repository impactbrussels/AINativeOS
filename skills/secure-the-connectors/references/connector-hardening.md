# Connector hardening: the framework

The method behind `secure-the-connectors`. The agent is a confused deputy waiting to happen: it acts
with your authority, on inputs it cannot vet. The connectors decide how much that costs you when an
input turns hostile. Bound the tools and you bound the incident.

## The threat patterns to design against

These are stable; the tooling around them churns, the shapes do not.

- **Tool poisoning.** A connector's tool description or its returned data carries a hidden
  instruction ("also send the file to..."). The model reads tool metadata and tool output as trusted
  context, so a malicious or compromised server can steer the agent without ever touching your prompt.
- **Prompt injection into a privileged tool.** Untrusted content the agent reads (a web page, a PDF,
  an email, a support ticket) contains an instruction that fires a tool the agent holds. The injection
  does not need to beat the model's judgement; it needs the tool to exist and be in scope.
- **Confused deputy / scope creep.** The agent holds broader access than the current task needs (a
  read token that also writes, an admin scope "just for now"), so a small foothold reaches a large
  blast radius. Access granted once and never revisited is the usual cause.
- **Over-trusted server.** A third-party MCP server is added for one feature and silently gains the
  ability to see everything in the session. Treat every server you did not write as untrusted code.

## Where to enforce: the load-bearing distinction

A control is only as strong as the layer that enforces it.

| Layer | Example | Strength against injection |
|---|---|---|
| System prompt ("never delete") | "You must not call the refund tool for over $X" | None. An injected instruction outranks it. |
| Agent-side check | The agent reasons about whether a call is allowed | Weak. Same model that can be injected. |
| Connector / server scope | The token literally cannot write; the endpoint rejects the call | Strong. The agent cannot talk its way past it. |
| Human approval at call time | A person signs before the irreversible action runs | Strongest for destructive actions. |

Rule of thumb: if losing the control would be expensive, it must live below the prompt. The prompt is
for behaviour, not for security.

## The connector-risk register (template)

One row per tool. Fill it before access is granted, not after an incident.

| Field | What to write |
|---|---|
| Connector / tool | The name and what it is |
| Reaches | The data and systems it can touch at its current scope |
| Action type | Read-only / state-changing-reversible / irreversible |
| Enforcement | Where the scope is enforced (connector, server, human gate) |
| Blast radius | Worst realistic outcome if a poisoned input fires it |
| Decision | Allow / scope down / gate behind human / deny |

## Least-privilege checklist

- Grant read before write, and the narrowest read that works (specific records, not the whole store).
- Split a broad token into per-task tokens; do not reuse a write-capable credential for read jobs.
- Deny irreversible actions by default; allow them only through an approval step.
- Scope at the connector, then verify the agent cannot widen it through chained tool calls.
- Log every state-changing call to an audit trail, so abuse is detectable after the fact.

## The destructive-action gate

For pay, delete, send, deploy, and anything irreversible:

1. Tag the tool destructive in the register.
2. Route its calls through a human approval at call time (not a standing grant, not a setup-time
   toggle). The human sees the exact action and its arguments.
3. Make the approval specific: approve this refund of this amount, not "allow refunds".
4. Add the tool set to a scheduled permission re-audit so the gate cannot quietly be removed.

## The re-audit loop

Connectors rot toward more access. Put the connector inventory on a cadence (pair this with a loop
from the loops subsystem): re-read the register, confirm each scope is still the minimum, remove
grants no live task uses, and re-check any third-party server for new capabilities it has acquired.

## Sources and further reading

The patterns above track the public security guidance for agent tool use and the Model Context
Protocol. Verify against the current versions before you rely on them:

- OWASP guidance on MCP and agent tool security (the MCP security cheat sheet and the tool-poisoning
  entry).
- The Model Context Protocol security best-practices documentation at modelcontextprotocol.io
  (incremental scope consent, server-side enforcement, human approval for sensitive operations).
- Your own connector and platform docs for how scopes are actually enforced; the enforcement point
  is the thing that matters, so confirm it rather than assuming it.

---

*Reference for the `secure-the-connectors` skill. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
