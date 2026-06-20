# Moat Method: Ranking, the Flywheel, Consortium Governance, and the Ledger

The deep framework behind `moat-strategy`. Source: Handbook
[Chapter 14, Moats, Data & Ecosystems](../../../handbook/14-moats-data-ecosystems.md). Output goes to
[`knowledge-base/MOATS-LEDGER.md`](../../../knowledge-base/MOATS-LEDGER.md). Read once, then work from
the tables.

## 1. The one structural fact

The model is rented and getting cheaper every quarter. If your advantage is the model, you have no
advantage, because your competitor signed the same rental agreement on the same terms. The durable
thing was never the intelligence you bought. It is the loop you built around it and the trust you
earned with it.

So the question is not "can it be built" but "what do you hold that nobody else can rent." Everything
below ranks the candidate answers.

## 2. The five moat types, ranked by durability, each with its test

| # | Moat type | Mechanism | The test it must pass | Durability | Fails when |
|---|-----------|-----------|-----------------------|-----------|------------|
| 1 | **Data flywheel** | Each use captures an outcome that sharpens the next response, which earns more use | Does each turn of the loop *widen* the gap, so a late entrant is behind by all the data they never collected? | Highest: compounds | Usage leaves no residue; a "data lake" that never feeds back |
| 2 | **Vertical / proprietary data** | Access, not algorithm: data behind consent, regulation, a sensor, or a relationship | Can a horizontal web-crawler *not* reach this? Is it scarce, private, and accumulated through real operation? | High | The data is web-scrapable; the giant already has it |
| 3 | **Data consortium** | Collective scale: a pooled, governed set larger than any member could build alone | Is the pool genuinely larger than any one member's, *and* governed with written terms? | High | Governance hand-waved; "everyone shares everything" |
| 4 | **Trust and compliance** | Time plus scrutiny: audit trail, validation record, clearances assembled slowly under audit | Does it take years, survive a regulator's inspection, and resist being generated on a Friday? | High, slow | Treated as a cost centre, not a product; not versioned or inspectable |
| 5 | **Brand / switching cost** | Accumulated customer-side work that leaving would forfeit | Does leaving cost the customer real, accrued work, not just swapping a logo? | Medium | The "switching cost" is cosmetic; a weekend migration |

Three of these are about data, two about judgement. The data moats compound; the judgement moats hold
because they cannot be rented. Rank your candidate, then be honest about which test it actually passes.

## 3. The flywheel design questions

A flywheel is a loop, not a snapshot. Answer all four in order, or you have a storage bill:

1. **What use?** The specific action a customer takes inside the product.
2. **Produces what proprietary data?** The residue that action leaves: a correction, an acceptance, an
   abandonment, an outcome. If the answer is "nothing the giant could not also collect", stop.
3. **That makes what better?** The exact response, ranking, or model that the residue sharpens.
4. **Which earns more use?** The reason a sharper product pulls in more interaction, which mints more
   data.

If any link is blank, the loop does not close, and an open loop is not a moat. The trap is building the
product and bolting analytics on later; by launch you have thrown away the corrections that were your
most valuable asset. Decide the capture loop on day one.

### The compounding test

A flywheel is only a moat if the gap *grows while the competitor is trying to catch up*. A rival can
copy the schema, the interface, even the exact model weights through the same API, and still face a
cold start with no data to feed any of it. If your "loop" produces an advantage that stays flat (a
one-time data dump, a static dataset), it is a feature, not a flywheel.

## 4. Data consortium governance checklist

For a fragmented sector where no single mid-size player holds enough data alone. The pooled set crosses
the threshold a giant has already passed; the consortium is defensible *because* it is shared and
governed. The governance is the product. Settle every row below in writing before any file is uploaded.

| Governance question | What to decide | Failure if skipped |
|---------------------|----------------|--------------------|
| Who sees what? | Per-member visibility: raw vs aggregated, masked vs full | A member discovers a rival can read its raw data after the fact |
| Who owns the model? | The consortium, a neutral entity, or shared licence | A custody fight stalls the pool the day it gets valuable |
| How does value flow back? | What each contributor gets: model access, royalties, governance seats | Big contributors feel robbed, withhold their best data |
| What stays private? | The data and outputs each member keeps exclusive | Accidental disclosure of a member's trade secret |
| Who can join, who is excluded? | Entry rules, especially keeping the trillion-dollar lab outside the tent | The competitor you were pooling against joins and free-rides |
| How is the data standardised? | The shared schema every member maps to | Incompatible formats make the pool unusable |
| Exit and dissolution | What happens to a member's data if it leaves; how the pool unwinds | Data is hostage; nobody can leave; trust collapses |

The structures that fail are the ones that hand-wave governance and discover the conflicts after the
data is mixed. Enter with the rules written down first. The first mover to organise the pool owns the
governance, and the governance is the moat.

## 5. How to ledger a moat

The `MOATS-LEDGER.md` tracks every candidate against four questions. Append a row, never overwrite.

| Ledger column | What to write |
|---------------|---------------|
| Moat candidate | The asset in a noun phrase (e.g. "corrected-output dataset for X") |
| What compounds with use? | The flywheel sentence: use -> data -> better |
| Can a horizontal AI giant reach this data? | Yes / No, and *why* (consent, regulation, sensor, relationship) |
| What trust/regulatory asset protects it? | The audit trail, validation record, patent, or clearance |
| Strength | weak / forming / real |

**Strength rubric:**

- **weak**: a plausible loop but no proprietary data yet, or the data is web-scrapable. A hope.
- **forming**: the loop is closing; proprietary data is accumulating; a giant cannot easily reach it,
  but the gap is not yet wide enough to be brutal to catch.
- **real**: the loop compounds, the data is unreachable by a giant, and a trust or regulatory asset
  walls it; a late entrant faces a cold start they cannot shortcut.

## 6. Worked example, end to end

**The company:** a regulatory-intelligence product for a narrow EU food-biotech niche. It uses a
rented model to answer dossier-strategy questions for consultants.

**Step 1, the flywheel sentence.**
Use: a consultant accepts, edits, or rejects each drafted dossier-strategy answer. Data: every
correction is captured as a labelled outcome tied to a real regulatory regime. Better: the corrections
retrain the retrieval and ranking so next month's answers match the regime's actual decision pattern.
Earns more use: sharper answers pull in more consultants, who mint more corrections.

The loop closes. Each link is filled.

**Step 2, rank the moat.**

| Type | Test | Verdict |
|------|------|---------|
| Data flywheel | Does each correction widen the gap? | Yes: corrections are the asset; a cold-start rival has none |
| Vertical/proprietary data | Can a web-crawler reach dossier-outcome corrections? | No: this never touched the public web |
| Trust/compliance | Does the validation record take years and survive scrutiny? | Forming: the provenance log is being built |
| Consortium | Could pooling beat a giant? | Possible later; the niche is fragmented across small consultancies |

Primary moat: **data flywheel**, reinforced by a **vertical data** advantage.

**Step 3, Remove-the-AI test on the whole company.**
Delete the model call. What is left? A proprietary, labelled dataset of dossier-outcome corrections no
giant collected, plus a provenance log a buyer can inspect. Not a generic chatbot. Load-bearing.

**Step 4, the consortium option.**
No single small consultancy holds enough corrections to train a strong regime-specific model. A
governed pool, eight consultancies in, each contributing masked corrections, crosses the threshold. The
governance sketch: members see only aggregated outcomes; a neutral entity owns the model; value flows
back as model access weighted by contribution; the frontier labs stay outside the tent. Build the tent
before a rival does.

**Step 5, the ledger entry (appended to `MOATS-LEDGER.md`):**

```markdown
| Dossier-outcome correction dataset (EU food-biotech niche) | Each accepted/edited/rejected answer is a labelled outcome that retrains retrieval to match the regime's real decision pattern | No: corrections never touched the public web; gated by consultant relationships | Versioned provenance log + validation record under build | forming |
```

## 7. Anti-patterns and fixes

| Anti-pattern | What it looks like | The fix |
|--------------|--------------------|---------|
| **Feature-as-moat** | Calling a clever prompt or a slick UI a moat | Audit extractability: a prompt copies in a weekend; pour budget into the low-extractability core |
| **Data lake, no loop** | "We collect a lot of data" with no feedback into the product | Close the loop: which signal each interaction leaves and how it sharpens the next answer |
| **Flat flywheel** | A one-time data dump dressed as a compounding loop | Apply the compounding test: does the gap *grow* while a rival catches up? |
| **Ungoverned consortium** | Pooling data first, writing rules later | Write the governance checklist before any upload; the governance is the moat |
| **Audit trail as cost** | Treating compliance records as a tax to minimise | Version it, keep it immutable, make it inspectable; it is the foundation of the moat |
| **Web-scrapable "moat"** | Defending with data the giant already has | Concentrate on rows behind consent, regulation, a sensor, or a relationship |

## 8. Copyable template

```markdown
# Moat Thesis: [DOMAIN]

## The flywheel (must close)
- Use:                  ______
- Produces proprietary: ______
- Which makes better:   ______
- Which earns more use: ______
(If any line is blank, this is a feature, not a moat.)

## Moat ranking (hardest first)
| Type | Test | Pass / fail | Note |
|------|------|-------------|------|
| Data flywheel | gap widens while rival catches up? | | |
| Vertical/proprietary data | giant cannot reach it? | | |
| Data consortium | pooled + governed? | | |
| Trust/compliance | years + survives scrutiny? | | |
| Brand/switching cost | real accrued work to leave? | | |

## Remove-the-AI test (whole company)
- Delete the model call. What stands that a rival can't rebuild in a weekend? ______

## Consortium governance (if fragmented sector)
- Who sees what: ______   Who owns the model: ______   Value flow back: ______
- What stays private: ______   Who is excluded: ______

## MOATS-LEDGER entry (append to knowledge-base/MOATS-LEDGER.md)
| Candidate | What compounds | Can a giant reach it? | Trust/regulatory asset | Strength |
|-----------|----------------|-----------------------|------------------------|----------|
|           |                |                       |                        | weak/forming/real |
```

Append the entry to `MOATS-LEDGER.md`, then re-run after the first real defensibility outcome via
`capture-learning`.
