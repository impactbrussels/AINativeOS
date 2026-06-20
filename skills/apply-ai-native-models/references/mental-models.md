# Mental Models: The Catalogue, the Order, and the Decision Memo

The deep framework behind `apply-ai-native-models`. These are the OS's core operating models, drawn
from `knowledge-base/PRINCIPLES.md`, the Handbook, and the Dictionary. The skill runs a hard decision
through all of them, in order. Read once, then work from the catalogue and the worked example.

## 1. The catalogue: each model, its test, its trap

The models trace the build arc, Frame to Defend. Run them in this order; the order is part of the
discipline, because the early models reframe the decision before the later ones price it.

| # | Model | One-line test | The trap it prevents | Build-arc stage |
|---|-------|---------------|----------------------|-----------------|
| 1 | **Remove-the-AI test** | Delete the AI from the thing you are deciding on. Does it still break? | Building an AI *feature* and pricing or defending it like an AI-native *company* | Frame / Defend |
| 2 | **Architecture-before-code** | Is the system designed on paper before any code is generated? | The faster mess: cheap AI code that collapses under growth because nobody shaped it first | Architect |
| 3 | **Adversarial-by-default** | Have I made the strongest case *against* this, not only for it? | Confirmation bias: ask AI to justify the idea and it will, fluently | Frame / cross-cutting |
| 4 | **Human-on-the-loop** | Is a person set above any irreversible step, setting the goal and reviewing the outcome? | Automating a call that needed a signature; a hallucination on a label, not a status report | Trust |
| 5 | **Store-the-proprietary, rent-the-replicable** | Am I building what compounds and renting what anyone can rent? | Pouring effort into the commodity layer the model vendor will absorb next release | Defend |
| 6 | **A demo is not evidence** | What did a *real user* in a *real situation* prove, not the demo? | Mistaking a slick prototype for demand, safety, or defensibility | Ship / Grow |
| 7 | **Proof before hype** | What claim here survives a web check or a real test? | Shipping a number or claim you cannot defend when challenged | cross-cutting |
| 8 | **Trust as the currency** | Does this earn or spend trust with the buyer, especially in a hard-mode sector? | Winning the demo and losing the market; trust is what converts in regulated domains | Trust / Grow |

### Notes on each

1. **Remove-the-AI test** is the repo's central diagnostic. Pull the model out; if the product still
   does its core job, AI was a garnish. It does not care what you call yourself, only what falls over
   when the model is gone. Run it on the *decision*, not just the company: "if I delete the AI from
   this feature, is there anything left worth shipping?"

2. **Architecture-before-code.** AI made prototyping nearly free, which is precisely how it hides the
   bill. A working version appearing is not a decision made. If the decision is "let's just build it",
   this model says: design the system first, write down the shape, then generate.

3. **Adversarial-by-default.** The single most important pass, and the one most often skipped. The
   model will happily argue for whatever you lean toward. So make it try to *refute* you. If the
   decision felt obviously right, that is the signal you most need the refutation.

4. **Human-on-the-loop.** Humans set goals and review outcomes; agents execute the steps between. The
   craft is the altitude: high enough that agents do real work, low enough that a bad outcome is caught
   before it reaches a customer. In anything irreversible, the human is non-negotiable and the
   deterministic fallback is fixed before the thing goes live.

5. **Store-the-proprietary, rent-the-replicable.** The model is rented at your competitor's price.
   Effort spent on the replicable layer (the prompt, the thin UI) is commoditised on you. Effort spent
   on the proprietary layer (the data flywheel, the domain integration, the trust record) compounds.
   The decision question: does this build the part that is mine, or the part anyone can rent?

6. **A demo is not evidence.** A working prototype proves nothing about demand, clinical safety, or
   operational safety. Name what still needs a human call and what still needs validation. "It works in
   the demo" is the sentence that precedes the expensive surprise.

7. **Proof before hype.** Numbers are exact, never "significant". A claim that cannot survive a web
   check or a real test does not ship. This applies to your own reasoning inside the memo: do not let a
   guess wear the clothes of a fact.

8. **Trust as the currency.** In hard-mode sectors the buyer does not ask whether your model is clever.
   They ask for the audit trail, the validation record, the clearances. The decision either earns that
   trust or spends it. Promise into trust, trust into trial, trial into traction.

## 2. How to run a decision through them, in order

1. **State the decision as a falsifiable sentence.** Not "improve onboarding" but "replace the manual
   onboarding review with an autonomous agent". A claim that could be proven wrong.
2. **Score model by model, top to bottom.** For each, write pass / fail / partial and one line of
   reasoning. Do not jump to the model that settles it; the value is in the full sweep.
3. **Run the adversarial pass with intent (model 3).** Make the strongest possible case the decision is
   wrong. Spend real effort here.
4. **Find the binding model.** Which model most constrains the call? That is usually where the decision
   actually turns.
5. **Make the call and name the riskiest assumption.** The single belief that is both most uncertain
   and most fatal if wrong. That is the next thing to test, not the most exciting thing.
6. **Route.** Map the memo's conclusion to a stage of work and run it back through `start-here`.

## 3. Worked example: a build-or-buy / what-to-ship decision

**The decision (falsifiable sentence):** "Ship our customer-support agent to auto-resolve refund
requests end to end, no human in the loop, because the demo handled twenty test cases cleanly."

**Score against the eight models:**

| # | Model | Verdict | Reasoning |
|---|-------|---------|-----------|
| 1 | Remove-the-AI test | Partial | Remove the AI and you still have a refund queue a human could clear. The AI is throughput, not the product. Fine, but do not price it as a moat. |
| 2 | Architecture-before-code | Fail | No system design exists. There is a demo, not a routing map, a guardrail set, or a fallback. Architecture is missing. |
| 3 | Adversarial-by-default | Fail | Strongest case against: a refund is irreversible money movement; one hallucinated approval is a real loss and a trust hit. The demo's twenty cases were happy-path. |
| 4 | Human-on-the-loop | Fail | The decision proposes *no* human on an irreversible action. This is the model that breaks the plan. |
| 5 | Store-the-proprietary, rent-the-replicable | Partial | The agent is a rented model behind a prompt. The proprietary asset would be the labelled resolution data, which the current plan does not capture. |
| 6 | A demo is not evidence | Fail | Twenty curated test cases prove nothing about the long tail of disputed, fraudulent, or edge-case refunds. No real-user evidence. |
| 7 | Proof before hype | Fail | "Handled twenty cases cleanly" is not a defensible claim about production reliability; no eval suite, no error-rate measure. |
| 8 | Trust as the currency | Fail | A wrong auto-refund (approve a fraud, deny a valid claim) spends trust with exactly the customers a support function exists to keep. |

**The binding model:** Human-on-the-loop (4), reinforced by "a demo is not evidence" (6).

**The call:** Do not ship end-to-end autonomy. Ship the agent in a *draft-and-sign* shape: it drafts
the refund decision with its reasoning, a human approves anything irreversible, and every approval is
captured as labelled data. This passes model 4, starts building the proprietary asset model 5 wanted,
and converts the demo into real evidence over time (model 6).

**The riskiest assumption (most uncertain AND most fatal):** "Refund disputes are reversible enough
that the cost of a wrong call is small." If false, even the draft-and-sign shape needs a tighter
deterministic stop on high-value or fraud-flagged refunds. **Test this first.**

**Route:** This is a Trust-stage and a Defend-stage decision. Run `start-here`, which will point to
`eval-and-safety-harness` for the safety question and `moat-strategy` for the data-capture question.

## 4. Anti-patterns and fixes

| Anti-pattern | What it looks like | The fix |
|--------------|--------------------|---------|
| **Cherry-picking the flattering model** | Scoring only the models the plan passes; quietly dropping the rest | Run all eight, in order; record the fails as prominently as the passes |
| **Skipping the adversarial pass** | "It obviously makes sense, so I moved on" | The obviousness is the trigger; spend real effort making the case against |
| **Demo as proof** | "It worked in the demo" treated as production evidence | Name what a real user has not yet proven; convert the demo into measured evidence |
| **No riskiest assumption** | A memo that ends on "looks good" | Force the single most-uncertain, most-fatal belief into one sentence; that is the next test |
| **Guess dressed as fact** | An unverified number in the memo's reasoning | Label it an assumption; apply proof-before-hype to your own memo |
| **No route out** | A memo with a verdict but no next action | Map the conclusion to a build-arc stage and run `start-here` |

## 5. Copyable template: the one-page decision memo

```markdown
# Decision Memo: [DECISION in one falsifiable sentence]
Domain: [DOMAIN]   Customer: [ICP]   Date: [DATE]

## Scores (all eight, in order)
| # | Model | Pass/Fail/Partial | One-line reasoning |
|---|-------|-------------------|--------------------|
| 1 | Remove-the-AI test | | |
| 2 | Architecture-before-code | | |
| 3 | Adversarial-by-default (strongest case AGAINST) | | |
| 4 | Human-on-the-loop | | |
| 5 | Store-proprietary, rent-replicable | | |
| 6 | A demo is not evidence | | |
| 7 | Proof before hype | | |
| 8 | Trust as the currency | | |

## The call
- Decision: ______
- Binding model (the one that most constrains it): ______

## Riskiest assumption (most uncertain AND most fatal if wrong)
- ______
- Test it by: ______

## Route
- Build-arc stage this points to: ______  -> run start-here
```

End every memo by testing the riskiest assumption first, and routing back through `start-here`.
