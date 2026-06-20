# Hypothesis Mining Method

The full framework behind `hypothesis-mining`. The job: convert a pile of raw research into a ranked
stack of falsifiable bets, separate the kinds of risk, and test the one that is most uncertain and
most fatal first. Built on Handbook [Chapter 02](../../../handbook/02-vague-idea-to-hypothesis.md).

## Where to mine, and what each source is good for

No single source tells you the whole risk picture. Interviews flatter, search data is cold and
honest, papers tell you what is hard. Mine widely, then triangulate.

| Source | Best at surfacing | The trap | How to read it |
|--------|-------------------|----------|----------------|
| Interview transcripts | Problem and demand risk | Politeness inflates demand | Weight the workaround, not the compliment |
| Support logs, forum threads | Live pain, real language | Loudest voice is not the median | Count frequency of a complaint, not its volume |
| Search / keyword volume | Existing demand | High volume can mean a solved problem | Look for unmet intent, not just searches |
| Papers, patents | Feasibility risk | Easy to over-trust a single result | Treat one paper as a claim, not a fact |
| Competitor 1-star reviews | The unmet job a rival left open | Outliers and trolls | Cluster the recurring complaint |

## The hypothesis template

Every belief becomes one line, with the bar set before any test:

> **We believe `[X]`. We'll know we're wrong if `[measurable bar]` by `[date / sample]`.**

Worked into shape: "We believe operations managers will pay to remove the Friday export. We'll know
we're wrong if fewer than 3 of 10 we offer a paid manual version to say yes within two weeks." That
is falsifiable. "We believe our dashboard is intuitive" is not, because nothing could fail it.

## The risk taxonomy

Classify each hypothesis, because the test differs by type and most founders only test the safe one.

| Risk type | The question | Cheapest test | The classic mistake |
|-----------|--------------|---------------|---------------------|
| **Problem** | Is the pain real and felt? | Past-behaviour interviews; find the workaround | Assuming the pain because you feel it |
| **Demand** | Will they move and pay? | A pre-sale, a paid pilot, a deposit | Mistaking "I'd use it" for "I'll pay" |
| **Solution** | Does our approach solve it? | A concierge or manual version, no code | Building the full thing to find out |
| **Feasibility** | Can we build it, legally and technically? | A spike; a regulatory check | Testing this first because it's the fun part |

The order founders default to (feasibility, then solution) is backwards. Problem and demand kill more
companies than feasibility, and they are cheaper to test. Run them first.

## The uncertainty x fatality scoring grid

Score each hypothesis on two axes, 1-5, and multiply. Test the highest product first.

**Uncertainty** (how unsure are you the belief is true?): 1 = near-certain, evidence already exists;
3 = a coin flip; 5 = pure assumption, no evidence either way.

**Fatality** (what happens to the company if this belief is false?): 1 = a tweak; 3 = a painful
pivot; 5 = the company has no reason to exist.

| Score (U x F) | Meaning | Action |
|---------------|---------|--------|
| 20-25 | The bet the whole company rests on, and you don't know it's true | Test this first, this week |
| 12-16 | Material risk, real uncertainty | Test next, once the top is resolved |
| 6-10 | Worth checking, not urgent | Backlog |
| 1-5 | Either near-certain or harmless | Note and move on |

The grid exists to stop you testing the 25-on-uncertainty-but-2-on-fatality assumption just because
it is interesting. A belief you are wildly unsure about but which would not sink you is a distraction.
The killer is the assumption that is both uncertain and fatal.

## Worked example, end to end

**Input:** ranked pain list from discovery, three competitor reviews, one keyword report.

**Mined beliefs, written as hypotheses and scored:**

| # | Hypothesis (We believe X; wrong if [bar]) | Risk type | Uncert. | Fatal. | Score |
|---|--------------------------------------------|-----------|---------|--------|-------|
| 1 | Ops managers will pay to remove the Friday export; wrong if <3/10 buy a paid manual version in 2 wks | Demand | 4 | 5 | **20** |
| 2 | The pain is weekly and felt; wrong if <half of 12 interviewees describe a current workaround | Problem | 2 | 5 | 10 |
| 3 | We can auto-clean the export reliably; wrong if accuracy <95% on 50 real files | Feasibility | 3 | 3 | 9 |
| 4 | Our UI is clearer than the incumbent's; wrong if <7/10 finish the task unaided | Solution | 4 | 2 | 8 |

**Read:** Problem (#2) is nearly certain from discovery, so its score drops despite high fatality.
Feasibility (#3) is tempting to build but only mid-fatal. The first test is **#1, demand**, scoring
20: most uncertain and most fatal. Run a paid manual pilot before writing a line of solution code.

## Anti-patterns and the fix for each

| Anti-pattern | What it looks like | The fix |
|--------------|--------------------|---------|
| Solution-shaped hypothesis | "We believe users want our dashboard" | Restate as a problem or demand belief about the customer's world |
| Untestable claim | "We believe the product is intuitive" | Add a measurable bar and a sample; if nothing can fail it, cut it |
| Confirmation-seeking bar | "Wrong if literally nobody is interested" | Set an honest threshold you'd actually act on (e.g. <3/10 buy) |
| Testing the easy assumption | Spending a month on feasibility first | Score by fatality; problem and demand usually outrank it |
| Ranking by what flatters | The model orders by what's easy to confirm | Force the U x F grid; see [sycophancy](../../../dictionary/05-failure-modes.md#sycophancy) |
| Inventing the number | "We believe the market is 2bn" | Label every market figure an assumption to verify, not a fact |

## Copyable backlog template

```
For each mined belief, fill one row:
Hypothesis: We believe [X]. We'll know we're wrong if [measurable bar] by [date/sample].
Risk type: [problem | demand | solution | feasibility]
Uncertainty (1-5): __   Fatality if wrong (1-5): __   Score (U x F): __
First test: [the cheapest experiment that could fail the bar]
Rank the table by Score, descending. The top row is what you test next.
```

When the backlog is ranked and the top assumption is named, carry it to `frame-the-hypothesis` to
sharpen the single bet, set its decision rule, and run the structured devil's advocate against it.
