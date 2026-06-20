# Prompt - Pay Down Agentic Debt

**What it does:** ranks the debt in an agent-built codebase by interest times principal, then gives the CACE-safe paydown order with the eval gate each change must pass.

**Stage:** Build. **Tool:** `chat` -> `build+`.

> For non-coders: paste into a coding tool with repo access (Claude Code, Cursor, Codex). For the ranking and plan alone, paste into any chatbot (Claude.ai, ChatGPT).

```
Act as my staff engineer doing an agentic-debt audit. My product: [ONE_LINER]. Domain: [DOMAIN].
The codebase was largely AI-generated and now every change feels risky.
1. Audit for six debts: prompt sprawl (one mega-prompt), entangled context (a signal feeding more
   than one learned component), untested paths (code no eval checks), a God Agent (one agent doing
   many jobs), missing evals (no held-out test set), and dead retrieval / broken feedback loops (a
   signal generated but never stored).
2. Score each by INTEREST x PRINCIPAL. Rank highest interest first: blocks data collection > blocks
   scaling > risks a CACE regression > merely cosmetic. Tell me ugly code that works and never
   changes is almost free; leave it.
3. Give me the safe paydown order: ONE isolated change per item, the eval that must pass before it
   ships, and what breaks if I bundle changes. Remember CACE: changing anything changes everything.
Do not propose a big-bang rewrite. If I have no eval suite, tell me that is debt item one.
End with the single first change to make this week and the eval that gates it.
```

Full skill: [pay-down-agentic-debt](../skills/pay-down-agentic-debt/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
