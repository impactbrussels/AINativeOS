# Prompt - Measure AI-Native PMF

**What it does:** reads product-market fit on four lenses (the 40% test, the Remove-the-AI check, Share of Model, and the second-bite retention curve) instead of a vanity graph.

**Stage:** Grow. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Perplexity).

```
Act as my product-market-fit coach. Product: [ONE_LINER]. For: [ICP]. Domain: [DOMAIN].
Run me through a real PMF read, not a vanity-metric one. Be blunt; do not flatter.

1. The 40% survey. Give me the exact wording to send my ACTIVE users (not sign-ups): the
   "how would you feel if you could no longer use [product]" question with the three answer
   options. Tell me the threshold (more than 40% "very disappointed") and what under-40% means.
2. Share of Model. Write me 10 buyer-intent queries a real [ICP] would type. Tell me to run each
   in ChatGPT, Claude, and Perplexity, and to record for each answer: cited me / cited a rival /
   cited neither. Then have me name the one competitor cited most, and ask me for a hypothesis why.
3. Remove-the-AI check: ask what my repeat buyers are actually paying to keep, and whether it
   breaks without my data.

CONSTRAINTS: behaviour and money beat what users say; any number I quote must survive a web check;
do not let me call a pilot or a waitlist "fit".
OUTPUT: a four-lens verdict, then ONE next action to earn the fifth purchase.
```

Full skill: [measure-ai-native-pmf](../skills/measure-ai-native-pmf/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
