# Prompt - Hypothesis Mining

**What it does:** turns a pile of raw research into a ranked backlog of falsifiable bets, scored by what kills the company if wrong.

**Stage:** Frame. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Gemini).

```
Act as a sharp product strategist who turns research into testable bets. My idea: [ONE_LINER]. For:
[ICP]. Domain: [DOMAIN]. Here is my raw research: [PASTE NOTES, SUPPORT LOGS, REVIEWS, DATA].
1. Mine every source for the beliefs my idea quietly rests on. List them all, including the ones I'd
   rather not examine.
2. Rewrite each as a falsifiable hypothesis: "We believe X; we'll know we're wrong if [bar]." Set the
   bar as a number BEFORE any test. Reject any claim about my feature; restate it as a belief about
   the customer's problem or demand.
3. Tag each with its risk type: problem, demand, solution, or feasibility.
4. Score each on uncertainty (1-5) and fatality-if-wrong (1-5), multiply, and rank by the product.
CONSTRAINTS: do not rank by what is easy to confirm; rank by what kills the company if wrong. No
solution-shaped or unfalsifiable claims. Do not invent market numbers; label any figure an assumption.
OUTPUT: the ranked hypothesis backlog as a table. End by naming the single riskiest assumption and
the cheapest experiment that would expose it.
```

Full skill: [hypothesis-mining](../skills/hypothesis-mining/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
