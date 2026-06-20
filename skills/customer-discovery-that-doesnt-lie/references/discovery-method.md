# Discovery Method: Facts, Not Opinions

The full framework behind `customer-discovery-that-doesnt-lie`. The job is one thing: design
discovery to hunt the reasons you are wrong, because discovery that asks for permission is always
granted it. Built on The Mom Test posture (ask about the past, not the hypothetical) and Handbook
[Chapter 04](../../../handbook/04-customer-discovery.md).

## The facts-not-opinions rule

An opinion is what someone says about your idea. A fact is what they have already done. Opinions are
free to give and bend toward politeness; facts cost the customer something to have happened, so they
do not bend. Every question you ask should pull a fact into the open and every question that pulls an
opinion should be cut. The test for a question: could the customer answer it with a compliment? If
yes, rewrite it until they cannot.

## Good question vs bad question

| Bad question (pulls an opinion) | Why it lies | Good question (pulls a fact) |
|----------------------------------|-------------|-------------------------------|
| "Would you use this?" | Free to say yes; costs nothing | "When did you last hit this problem? Walk me through it." |
| "Do you like the idea?" | Invites a compliment | "What did you do about it last time?" |
| "How much would you pay?" | Hypothetical price is fiction | "What do you spend on the current workaround?" |
| "Is this a problem for you?" | Leading; answer is baked in | "Talk me through your week. Where does the time go?" |
| "Would feature X help?" | Pitches, then waits for applause | "What have you already tried? Why did it not stick?" |
| "Don't you think it's slow today?" | Leading and loaded | "How long did that task take you yesterday?" |

## The extraction rubric

Never accept a mood summary ("generally positive, some concerns"). Force extraction: every concrete
claim, tagged with who said it, scored on four axes. Score each pain 0-3 per axis.

| Axis | 0 | 1 | 2 | 3 |
|------|---|---|---|---|
| **Severity** | Mild annoyance | Recurring friction | Costs real money or hours | Blocks the job; they'd quit over it |
| **Frequency** | Once ever | A few times a year | Monthly | Weekly or daily |
| **Current workaround** | None; ignores it | A mental note | A manual hack (spreadsheet, copy-paste) | Pays a person or a tool to cope |
| **Willingness-to-pay signal** | "Nice to have" | Asked the price | Already pays for a partial fix | Asked to buy, or to be first in line |

Total each pain out of 12. Rank descending. A pain scoring 10+ with a costly workaround and a paid
alternative is the one to chase. A pain scoring 4 that everyone "loved" is noise dressed as signal.

## Counting commitments, not compliments

Sentiment is not evidence; advancement is. After each interview, record what the customer gave up,
not how warm they were.

| What they said | What it counts as |
|----------------|-------------------|
| "Great idea, keep me posted" | Zero. A polite exit. |
| "Send me the beta when it's live" | Weak. A soft maybe. |
| Introduced you to two colleagues | Real. A referral has a social cost. |
| Booked a follow-up and brought their boss | Strong. Time and political capital spent. |
| Pre-paid, or signed a letter of intent | Strongest. Money is the only honest survey. |

## Worked example: from a messy note to a ranked insight

**Raw note (one interview, lightly cleaned):** "Yeah the reporting is annoying. Honestly every Friday
I export everything to a spreadsheet and clean it by hand, takes me about two hours, sometimes three
if the data's messy. I've looked at two tools but they were too expensive for what they did. I'd love
something that just did it. My manager hates that the numbers are late."

**Bad reading (the average):** "Positive on reporting automation; some price sensitivity." Useless.
It buried the only data worth having.

**Extracted facts, tagged and scored:**

| Pain (who) | Severity | Frequency | Workaround | WTP signal | Total |
|------------|----------|-----------|------------|------------|-------|
| Friday manual export, 2-3 hrs (this user) | 2 | 3 (weekly) | 3 (manual spreadsheet) | 2 (looked at paid tools) | **10** |
| Numbers reach manager late | 2 | 3 | 1 | 1 | 7 |

**Ranked insight:** the top pain is a weekly two-hour manual workaround the user already tried to buy
away. That is a fact with a price tag. **Belief to test next:** "Users like this will pay to remove
the Friday export." Cheapest test: offer to do the export by hand for three users next Friday for a
small fee and see who pays. Note the discounting: "I'd love something that just did it" scored zero on
its own. The two hours and the tools they priced are what carry the rank.

## Anti-patterns and the fix for each

| Anti-pattern | What it looks like | The fix |
|--------------|--------------------|---------|
| Leading the witness | "Don't you find X frustrating?" | Ask about the past in neutral words; let them name the pain. |
| Pitching instead of listening | Five minutes explaining your idea, then "so?" | Talk less than a third of the call. Pitch only after the facts are out, to test reaction, not to sell. |
| Counting compliments as validation | "Three people said they loved it" | Count costly commitments only. A compliment scores zero. |
| Averaging away the outlier | Model returns "mixed feedback" | Forbid the average. Demand two columns: supporting and opposing, with quotes. |
| Asking the model for support | "Do my interviews back the idea?" | Order the inverse: the five ranked reasons they won't pay. See [sycophancy](../../../dictionary/05-failure-modes.md#sycophancy). |
| Hypothetical pricing | "They'd pay 50 a month" | Only a real transaction or a priced alternative counts. Stated price is fiction. |

## Copyable extraction prompt

```
You are extracting facts from customer interviews, not reading the mood. Here are raw transcripts:
[PASTE]. Rules: (1) pull every concrete claim about past behaviour, cost, frequency, or workaround;
(2) tag each with the speaker; (3) score each pain 0-3 on severity, frequency, workaround, and
willingness-to-pay signal, total out of 12, ranked descending; (4) put supporting and opposing
evidence in two columns and do NOT average the outliers away; (5) finish with the five most likely
reasons these people will NOT pay, ranked, each backed by an exact quote. Do not flatter the idea.
```

When the ranked pain list is in hand, carry it to `hypothesis-mining` to turn the top pains into
falsifiable bets with explicit pass/fail bars.
