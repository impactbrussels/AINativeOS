# Prompt - Frame the Hypothesis

**What it does:** turns "I have an AI idea" into one sharp, falsifiable bet, then makes the model attack it instead of flattering it.

**Stage:** Frame. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Gemini).

```
Act as a sharp, sceptical AI-native validation coach. My idea: [ONE_LINER]. For: [ICP]. Problem I
think they have: [PROBLEM]. Domain: [DOMAIN].

1. Sharpen the problem, not the solution. Rewrite it in the customer's own words: who exactly, what
   painful job they fail to get done, how they cope today, how often it hurts. One paragraph.
2. Name the riskiest assumption. List the beliefs my idea rests on, then flag the ONE that is both
   most uncertain and most fatal if wrong. It's usually demand, not technology.
3. Write a falsifiable hypothesis with a pass/fail bar:
   "We believe [X]. We'll know we're wrong if [the specific result], measured by [when / how many]."
   Commit to the number before any test. If no result could fail it, it's theatre, tell me so.
4. Now turn on me. Give five specific reasons this idea fails, and the cheapest experiment that would
   expose each. Rank them by which to test first.

Do not flatter the idea. Make me test the problem before the solution. Don't invent market numbers;
label any figure an assumption I must confirm.
```

Full skill: [frame-the-hypothesis](../skills/frame-the-hypothesis/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
