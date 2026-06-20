# Hypothesis Craft: The Falsifiable Bet

The full method for turning "I have an AI idea" into one sentence reality can prove wrong for the price
of a week. A demo is not demand. AI made the prototype free, which is exactly why a prototype proves
nothing. This file expands the four moves, gives the scoring rubric, and walks one example end to end.

## Anatomy of a falsifiable hypothesis

A hypothesis is a claim that names, in advance, the result that would kill it. Four parts, all required.

| Part | What it pins down | Failure if missing |
|------|-------------------|--------------------|
| **Subject** | Who exactly has the problem (`[ICP]`), in their words. | "Users" is nobody. You will read every signal as a yes. |
| **Claim** | The specific, measurable thing they will do. | "They will love it" cannot fail, so it teaches nothing. |
| **Bar** | The pass/fail number, set before the test. | A bar set after the data is a rationalisation with a ruler. |
| **Date** | When you decide. | No date means the test never ends and the bet never resolves. |

Template: *"I believe `[ICP]` will `[measurable action]`; I will know I am wrong if fewer than `[bar]`
do so by `[date]`."* If it does not fit that shape, it is a hope.

## Riskiest-assumption scoring: uncertainty x fatality

Every idea rests on a stack of beliefs. You do not test all of them. You test the one that is both most
uncertain and most fatal if wrong, because that is where reality can save you the most money. Score each
assumption on two axes, 1 to 3.

- **Uncertainty:** how unsure are you it holds? 1 = near-certain, 3 = a genuine coin-flip or worse.
- **Fatality:** if it is false, how dead is the company? 1 = a setback, 3 = there is no business.

Multiply. The highest product is the riskiest assumption, and it is almost always a problem or demand
belief, not a technical one.

| Example assumption | Uncertainty | Fatality | Score | Test first? |
|--------------------|-------------|----------|-------|-------------|
| The model can draft a usable dossier | 1 | 3 | 3 | No, demo already shows it |
| Founders will trust a machine draft enough to file it | 3 | 3 | 9 | **Yes, the riskiest** |
| The market is large enough to fund a company | 2 | 3 | 6 | Second |
| We can host the model cheaply at scale | 2 | 1 | 2 | Defer |

A 9 next to a 3 tells you the demo proved the wrong thing. Technical risk feels urgent because it is the
part you can build. Demand risk decides whether the building was worth it.

## Pass/fail bar rules

The bar comes before the data. Humans see success in noise when they grade their own homework after the
fact, so the number exists to stop the goalposts moving.

1. **Set the number in writing before you run anything.** "At least 12 of 30 interviewees describe the
   workaround unprompted." Not "lots of them".
2. **Make it cheap to fail.** A hypothesis you can only disprove by building and launching the whole
   product is testable in theory and useless in practice. Design the test to cost a week and a few
   conversations, never the company.
3. **Use a known proxy where one fits.** For "people would genuinely miss this", the 40% rule (the Sean
   Ellis test) sets a defensible line: at least 40 per cent of users say they would be very disappointed
   without it. Pick the threshold, then let reality grade the homework.
4. **One bar, one decision.** State what you do if it passes and what you do if it fails, before you look.

## The structured devil's-advocate protocol

Ask a model whether your idea is good and it will find the good in it, fluently. That is sycophancy: the
system optimising for an answer you will like over the answer that is true. You already carry confirmation
bias; an articulate partner that manufactures supporting evidence on demand makes a perfect echo chamber.
Invert the prompt. Do not ask it to evaluate. Order it to refute.

The move, every time: *"Give five reasons this fails, ranked by how likely each is to kill me, and the
cheapest test for each."* Then run it again wearing different hats, because each persona finds a
different class of flaw.

| Persona | The flaw it surfaces |
|---------|----------------------|
| Sceptical customer | "I would not change my workflow for this; my tape-and-spreadsheet works." |
| Competitor | "We ship this as a free feature next quarter and you are a wrapper." |
| Regulator | "You cannot make that claim without a dossier, and the clock is two years." |
| Investor | "Where does this compound? Strip the AI and what is left?" |

An objection you cannot answer is the cheapest information you will ever buy. Dispatch the
`devils-advocate` agent for a harder pass when the stakes warrant it.

## Worked example end to end

A founder says: "An AI that drafts EU food-safety dossiers for early-stage startups."

1. **Problem, in the customer's words.** A two-person food startup must file a Novel Foods dossier,
   cannot afford a 40,000-euro consultant, and currently copies a competitor's public filing by hand
   over six weeks, terrified they have missed a data requirement. That is the pain, with fingerprints.
2. **Assumption stack, scored.** Model can draft (unc 1 x fat 3 = 3). Founders will trust a machine
   draft enough to file (3 x 3 = 9). Market is fundable (2 x 3 = 6). Riskiest: the trust belief, at 9.
3. **Falsifiable hypothesis.** "I believe at least 8 of 15 pre-revenue food founders shown a sample
   AI-drafted dossier section will say they would pay 500 euros for a full draft and ask to be first in
   line; I will know I am wrong if fewer than 8 do, by 18 July."
4. **Devil's advocate, five reasons it fails.** (a) They will not file something they did not write, on
   a document that risks a recall. (b) The real buyer is the consultant, not the founder, and the
   consultant will not arm a tool that replaces them. (c) The dossier that matters is the one EFSA
   accepts, and the model cannot know what sank last year's applicants. (d) The market of pre-revenue
   food founders filing Novel Foods this year is tiny. (e) Strip the AI and you have a template anyone
   can copy, which is what they already do for free.
5. **Cheapest test for the top objection.** Objection (a), trust, is the riskiest and cheapest to test:
   show 15 founders one drafted section and measure stated willingness to pay and to file. One week, no
   code beyond a sample.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| Solution-shaped hypothesis | "Users will love the AI dossier tool." It describes your build, not their behaviour, and cannot fail. | Rewrite as a measurable claim about who acts and how, with a number and a date. |
| Untestable bar | "If lots of people are interested." No number, so every result reads as a yes. | Set the exact threshold in writing before the test, and the decision for pass and for fail. |
| Confirmation-seeking | Asking the model to validate the idea, collecting its fluent praise as evidence. | Invert the prompt: five ranked reasons it fails, plus the cheapest test for each. |
| Testing technical risk | Building harder to "prove it works" when the demo already shows it does. | Score uncertainty x fatality; you will find demand risk outranks the build. |
| Expensive falsifiability | The only way to be proven wrong is to launch the whole product. | Redesign the test to cost a week: interviews, a fake landing page, a concierge run by hand. |

## Copyable template

```
FRAME THE HYPOTHESIS: [PRODUCT]
Idea: [ONE_LINER]   For: [ICP]   Domain: [DOMAIN]

PROBLEM (customer's words): who, what painful job, how they cope now, how often it hurts
  ___________________________________________________________

ASSUMPTION STACK (score uncertainty x fatality, 1-3 each)
  - ________________________  U[ ] x F[ ] = [ ]
  - ________________________  U[ ] x F[ ] = [ ]
  - ________________________  U[ ] x F[ ] = [ ]
  RISKIEST (highest product): _______________________________

FALSIFIABLE HYPOTHESIS
  I believe [ICP] will [measurable action];
  I will know I am wrong if fewer than [bar] do, by [date].
  If it passes: __________   If it fails: __________

DEVIL'S ADVOCATE (five ranked reasons it fails + cheapest test for each)
  1. ____________________________  test: __________________
  2. ____________________________  test: __________________
  3. ____________________________  test: __________________
  4. ____________________________  test: __________________
  5. ____________________________  test: __________________

NEXT: run map-the-terrain or architect-before-code
```
