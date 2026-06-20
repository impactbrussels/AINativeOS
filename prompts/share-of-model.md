# Prompt - Measure Your Share of Model

**What it does:** measures how often AI engines name you versus competitors when a buyer is deciding, and sets your starting number.

**Stage:** Grow. **Tool:** `chat`.

> For non-coders: paste into Claude.ai, ChatGPT, and Perplexity, once each, and compare.

```
Act as my AI-native go-to-market analyst. My product: [ONE_LINER]. Who it's for: [ICP]. Domain:
[DOMAIN]. My main competitors: [2-4 NAMES].

1. Write 10 to 20 real buyer queries someone in my ICP would type when deciding what to buy: "best
   tool for [job]", "how do I [solve PROBLEM]", "[competitor] alternatives", and so on. Mix
   category, comparison, and problem-led queries.
2. For each query, answer it the way a buyer would read it, then record: was I cited or named? Which
   competitors were cited? Who came first?
3. Tally it into a table: query, me cited (yes/no), competitors cited, top result.
4. Compute my starting Share of Model: the share of queries where I'm named at all, and the share
   where I'm named first. Tell me both numbers plainly.
5. Name the three queries where I'm most absent but most should appear. That's where the work is.

This is one engine's view. Tell me to re-run the same queries in ChatGPT, Claude, and Perplexity and
compare, because each cites differently. Don't pad my number; if I'm rarely cited, say so.
```

Full skill: [share-of-model-audit](../skills/share-of-model-audit/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
