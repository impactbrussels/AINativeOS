# Agentic Debt: the full paydown method

The discipline is one sentence: in a system with a learned component there is no local change, so you
rank debt by interest rate and pay it down one isolated change at a time, each through the full eval.
This file holds the taxonomy, the scoring grid, the CACE-safe protocol, a worked example, the
anti-patterns, and a copyable ledger.

## 1. The debt taxonomy

Six categories cover almost all agentic debt. Name the category before you score the item; a vague
"this is messy" cannot be ranked, scheduled, or paid.

| Category | Symptom in the wild | Root failure mode |
|---|---|---|
| **Prompt sprawl** | One growing mega-prompt; a rule bolted on per case | Entanglement: one context, no capability testable alone |
| **Entangled context** | A signal (a field, a cache, a model output) feeds more than one learned component | CACE: a fix here shifts outputs you cannot predict |
| **Untested paths** | Code that ships with no eval asserting on its content | Silent failure: wrong is not loud, the logs stay green |
| **God Agent** | One capable agent owns many jobs inside one prompt | Maximum entanglement by construction; unauditable |
| **Missing evals** | No held-out set, no eval suite, "it worked when we built it" | You cannot prove any change safe, only hope |
| **Dead retrieval / broken loop** | A signal is generated but never stored; a correction goes nowhere | The leak in the moat: learning a competitor never recovers |

## 2. The interest / principal scoring grid

Treat debt the way debt works: a thing with an interest rate. **Interest** is how fast it compounds
and how much it costs you per day left unpaid. **Principal** is the one-off cost to fix it. Rank by
interest first; a high-principal, high-interest item still beats a cheap cosmetic one.

| Interest tier | What sits here | Action |
|---|---|---|
| **Highest** | Blocks data collection: a silently open loop, a dropped signal, a correction with nowhere to go | Pay first, even if nobody is complaining |
| **High** | Blocks scaling: an architectural flaw growth will hit, a God Agent every edit risks | Pay next, before it seizes the system |
| **Medium** | High CACE risk: entangled, touches many learned parts, no eval protecting it | Pay once an eval exists to gate it |
| **Lowest** | Cosmetic: ugly code that works and never changes | Leave it. It is almost free |

The counter-intuitive rule: the debt that screams (ugly, embarrassing code) is rarely the debt that
kills you. The quiet leak (the broken feedback loop, the unlogged signal) costs nothing today and the
moat tomorrow. In a hard-mode company the proprietary dataset is the whole defensible asset, so a hole
in data collection is almost always item one.

## 3. The CACE-safe refactor protocol

Run this loop for every single item. Never bundle.

1. **Hold the map.** Confirm what is downstream of the change and whether any of it is learned. If you
   cannot say, run `architect-before-code` to rebuild the System Inventory first.
2. **Change one thing.** One prompt edit, one extracted specialist, one stored signal. Not two.
3. **Run the full eval.** Not the part you touched, the whole suite. CACE means the regression hides
   three hops away.
4. **Measure.** Compare against the golden dataset. Did anything downstream move?
5. **Keep or revert.** Pass, commit and log it. Regress, revert in full and shrink the change.
6. **Record the trade-off.** Append a dated line to `CLAUDE.md`: what you changed, what you deferred,
   any new entanglement. Visible debt can be ranked next month; invisible debt cannot.

If you have no eval suite, you cannot run steps 3 to 5, which means your missing-evals debt is the
highest-interest item you own. Build the held-out set before you refactor anything else.

## 4. Worked example, end to end

**System.** A supplier-document checker for a food brand: an agent reads supplier PDFs, flags missing
fields, and a human approves. Built fast by an agent over six weeks.

**Audit (Step 1).** Four items found:
- A: one mega-prompt handles reading, flagging, and tone (prompt sprawl + God Agent).
- B: the "approved" decision a human makes is shown on screen but never written back to storage
  (broken loop).
- C: the PDF parser has no eval; nobody knows its accuracy (untested path + missing evals).
- D: variable names are inconsistent and ugly (cosmetic).

**Score (Step 2).**

| Item | Interest | Why | Rank |
|---|---|---|---|
| B | Highest | Each approval is a free training label thrown away daily; this is the moat leaking | 1 |
| C | High / Medium | No eval means no change is provably safe; blocks confident scaling | 2 |
| A | Medium | Entangled, brittle, but works today; needs an eval (C) before it is safe to split | 3 |
| D | Lowest | Works, never changes | Leave |

**Paydown (Steps 3 to 4).**
1. Item B: store every human approve/correct decision with the input. One change. Run the eval
   (outputs unchanged, a new signal now persists). Keep. The flywheel starts turning.
2. Item C: build a held-out set of 50 labelled PDFs; assert on extraction accuracy. Now there is a gate.
3. Item A: extract the "flagging" specialist first, behind a dumb gateway. Run the full eval (C plus
   the rest). Tone drifted on one path, CACE in action. Revert, shrink, retry. Keep.
4. Item D: untouched.

The debt that screamed (D, the ugly code) was left. The debt that was killing the company (B, the
silently open loop) was paid first, and it was the one nobody had filed a complaint about.

## 5. Anti-patterns and fixes

| Anti-pattern | Why it fails | Fix |
|---|---|---|
| **Big-bang refactor** | Rewriting the God Agent in one swing maximises CACE blast radius; you cannot tell which change broke what | Extract one specialist, gate it on the eval, repeat |
| **Fixing without an eval** | You ship a "safe" change and the regression surfaces three hops away in production | Build the held-out set first; gate every change |
| **Trusting the diff** | The diff shows the lines you touched, never the learned behaviour you moved | Measure against the golden dataset, do not reason |
| **Ranking by ugliness** | The loudest debt is rarely the highest-interest; cosmetic work feels productive and pays nothing | Score by interest: data collection, then scaling, then CACE |
| **Smart gateway** | The router carries "just one case" of domain logic and you have rebuilt the God Agent | Keep the gateway dumb: it routes, specialists work |

## 6. Copyable ledger template

```
# Agentic Debt Ledger: [product], [date]

| ID | Category | Description | Interest (data/scale/CACE/cosmetic) | Principal (S/M/L) | Rank | Eval gate | Status |
|----|----------|-------------|--------------------------------------|-------------------|------|-----------|--------|
| B  | broken loop | approvals never stored | data collection (highest) | S | 1 | outputs unchanged + signal persists | done |
| C  | missing eval | parser has no held-out set | scaling (high) | M | 2 | 50-PDF golden set passes | doing |
| A  | God Agent | one prompt, three jobs | CACE (medium) | L | 3 | full suite, tone stable | next |
| D  | cosmetic | ugly variable names | cosmetic (lowest) | S | leave | n/a | parked |

Rule: change one item at a time, run the FULL eval, keep or revert, append the trade-off to CLAUDE.md.
Re-run this audit monthly. The quiet leak is usually rank 1.
```
