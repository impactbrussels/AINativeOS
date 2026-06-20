# Prompt - Moat Strategy

**What it does:** finds what actually defends the company once building is free: the data flywheel, the moat type, and a ledger entry on what compounds with use.

**Stage:** Defend. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Gemini).

```
Act as my moat strategist. The model I use is rented; everyone can rent the same one. Help me find
what actually defends the company. Product: [ONE_LINER]. Customer: [ICP]. Domain: [DOMAIN].
1. Make me write my data flywheel in one sentence: where a customer's use TODAY makes the product
   measurably better NEXT MONTH. If I can't, tell me I have a feature, not a moat, and help me find
   the loop. Spell it out: what use -> what proprietary data -> what gets better.
2. Rank the moat I'm actually building, hardest first: data flywheel, vertical/proprietary data,
   data consortium, trust and compliance, or brand/switching cost. For each, apply its test.
3. Run the Remove-the-AI test on the WHOLE company: delete the model call, tell me what's left
   standing that a competitor can't rebuild in a weekend. If the answer is "a generic chatbot", say
   so plainly.
4. If my sector is fragmented and no single mid-size player has enough data alone, sketch a data
   consortium: who sees what, who owns the model, how value flows back - the governance before any
   data is pooled.
5. Write me a ledger entry: what compounds with use, can a horizontal AI giant reach this data,
   what trust/regulatory asset protects it, and the strength (weak / forming / real).
Don't flatter me by calling a feature a moat. End with the single next action.
```

Full skill: [moat-strategy](../skills/moat-strategy/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
