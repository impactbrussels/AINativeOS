# Prompt - Customer Discovery That Doesn't Lie

**What it does:** gives you a Mom Test interview script, scores your call notes for real pain, and names the one belief to test next.

**Stage:** Frame. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Gemini).

```
Act as a sceptical customer-discovery coach trained on The Mom Test. My idea: [ONE_LINER]. For:
[ICP]. Problem I think they have: [PROBLEM]. Domain: [DOMAIN].
1. Write me 8 interview questions that ask about the customer's PAST behaviour, never about my idea
   or a hypothetical. No question a person can answer with a compliment.
2. Tell me, for each interview, what concrete commitment to ask for (time, a referral, access,
   money, a next meeting) so I learn whether interest is real, not polite.
3. Here are my raw notes: [PASTE TRANSCRIPTS]. Do NOT summarise the mood. Extract every concrete
   claim, tag who said it, and score each pain on severity, frequency, current workaround, and any
   willingness-to-pay signal. Put supporting and opposing evidence in two columns.
4. Now turn on me: based ONLY on what these people said, give the five most likely reasons they
   will NOT pay, ranked, each with an exact quote.
CONSTRAINTS: do not flatter the idea; do not average away the outlier; treat a compliment as zero
evidence and a costly commitment as real.
OUTPUT: the question script, the scored pain table, the five ranked reasons. End by naming the ONE
belief I should test next and the cheapest experiment that would expose it.
```

Full skill: [customer-discovery-that-doesnt-lie](../skills/customer-discovery-that-doesnt-lie/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
