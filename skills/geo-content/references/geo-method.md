# GEO Content: The Deep Framework

> Write content an AI engine extracts and cites, not content that merely ranks. This file holds the
> full method behind the `geo-content` skill: the extractability rules, the citation-factor
> checklist, the four format templates, a worked rewrite end to end, the anti-patterns and their
> fixes, and a copyable brief. Source: handbook
> [Chapter 10](../../../handbook/10-narrative-positioning-geo.md).

## Why the surface moved

A search engine ranked pages and let the human choose which to click. A generative engine reads
across the web, writes one answer in its own voice, and names a handful of sources as evidence. The
unit of victory changes from **rank** to **citation**. Citation rewards content a model can lift
cleanly and attribute with confidence, and it punishes the keyword-stuffed page built to game a
crawler. You can still rank and never appear in the paragraph the buyer read. The engine did not
rank you and skip you. It synthesised an answer from someone else's words, and you were never in the
room where the synthesis happened.

Two facts follow, and both shape every rule below.

1. **The engine is managing its own risk.** It gravitates to sources that make its answer
   defensible: a named statistic, an expert quote, genuine technical depth. A number floating free
   reads as the kind of thing that gets a model caught hallucinating, so it would rather not risk
   you.
2. **The claim and the proof must be the same length.** The moment you publish a claim extractable
   enough to quote, you have published it in a form a regulator, or a sceptical buyer, can quote
   back. Do not soften the claim. Close the gap under it.

## The extractability rules

A self-contained sentence is liftable. One that needs its neighbours is not. These five rules turn a
page a model reads past into a page a model quotes.

| Rule | What it means | The failing version | The passing version |
| --- | --- | --- | --- |
| **Answer first** | Open every section with a standalone answer to the heading's question. | "There are many factors to consider when..." | "A novel-food dossier in the EU runs about 28 months from submission to authorisation." |
| **One claim per chunk** | Each paragraph carries one liftable idea, complete on its own. | A six-sentence paragraph where the point is in sentence five. | A two-sentence paragraph: claim, then the number that proves it. |
| **Source in the same breath** | Attach the provenance to the number inside the same sentence. | "Adoption is high." | "More than 40% of US physicians use it (CNBC, Jan 2026)." |
| **Name the mechanism** | State *why* it works, with a named mechanism, not an adjective. | "Our platform is powerful." | "It mines the molecular properties of plants to mimic animal foods." |
| **Heading = query** | Make the H2 the literal question a buyer types. | "Our Approach" | "How long does EU novel-food approval take?" |

The read test for any section: delete every sentence except the first. Does the first sentence still
answer the heading on its own? If not, the section is not extractable yet.

## The citation-factor checklist

Run every piece through this before publishing. A draft that fails any row is a draft the engine
reads past.

| Factor | What the engine looks for | Pass test | Common miss |
| --- | --- | --- | --- |
| **Clarity** | A chunk it can lift without surrounding context. | Each section opens with a complete, self-contained sentence. | The point arrives in paragraph six. |
| **Structure** | Headings that map to real questions; answer before depth. | H2s are buyer queries; the answer leads, the depth follows. | "Our Solution", "Why Us", marketing headings. |
| **Specificity** | Exact figures and named mechanisms. | Every claim has a number or a named mechanism, never "significant". | Hedge words: powerful, robust, leading. |
| **Authority** | Signals of trust a machine can detect. | Every statistic names its source; every expert claim names the expert. | Unsourced statistics that read as risk. |
| **Freshness** | A current, dated figure. | The page is dated and carries the most recent verified number. | A 2022 figure presented as today's. |
| **Provenance** | A claim the engine can defend repeating. | The proof behind the boldest claim would survive your sector's regulator. | A claim sharp enough to quote, proof that cannot carry it. |

## The four format templates

Pick the format from the query shape. Each opens with the liftable answer, then pours depth
underneath: you are writing two documents at once, a quotable headline for the machine and the depth
for the person the machine sends you.

### 1. Definitional (query: "what is X")

```
## What is [term]?

[Term] is [one-sentence standalone definition: genus + differentia, no jargon before the plain word].

It works by [named mechanism in one sentence]. The distinction that matters: [the one contrast a
buyer confuses it with], because [why that contrast decides the purchase].

[Depth: 2-4 paragraphs of mechanism, caveat, and the failure mode a thin competitor cannot fake.]
```

### 2. Comparative (query: "X vs Y", "X alternatives")

```
## [X] vs [Y]: which fits [job]?

Choose [X] when [decisive condition]. Choose [Y] when [decisive condition]. [The verdict, first.]

| Criterion | [X] | [Y] |
| --- | --- | --- |
| [criterion 1] | [specific, sourced] | [specific, sourced] |
| [criterion 2] | ... | ... |

[Depth: the trade-off behind each row, with the number and its source.]
```

### 3. Data-led (query: "how much / how long / how many")

```
## How long does [process] take?

[Process] takes about [exact figure] ([named source, date]). [The number, with provenance, in the
opening sentence.]

The range moves with [the variable]: [low] when [condition], [high] when [condition]. [Then the
caveat that keeps the number honest.]

[Depth: the components that make up the figure, each sourced.]
```

### 4. FAQ / steps (query: "how do I [job]")

```
## How do I [job]?

[The direct one-sentence answer.] Then: [the numbered method].

1. [Imperative step, with the decision the buyer faces.]
2. ...

[Depth under each step: the gotcha, the named tool, the failure mode.]
```

## Worked example: vague vendor page to citable section

A precision-fermentation ingredients company has a pillar page on EU approval timelines. Below is the
before, the diagnosis, and the rewrite. The domain is illustrative; the rules are universal.

### Before (high-extractability hype, zero citation value)

> **Navigating the Regulatory Landscape**
>
> In today's rapidly evolving food-tech world, understanding the regulatory environment is more
> important than ever. Our team brings deep expertise to help you seamlessly navigate the complex
> and ever-changing approval process. We have helped many clients unlock the power of novel foods,
> and we pride ourselves on our robust, end-to-end support. Reach out to learn how we can transform
> your regulatory journey.

### Diagnosis against the checklist

| Factor | Verdict | Why |
| --- | --- | --- |
| Clarity | Fail | No section surrenders a standalone sentence; every line leans on the next. |
| Structure | Fail | Heading is "Navigating the Regulatory Landscape", a phrase nobody types. |
| Specificity | Fail | Not one number; "many clients", "complex", "robust". |
| Authority | Fail | No source, no named expert, no named mechanism. |
| Freshness | Fail | No date, no current figure. |
| Provenance | Fail | Nothing to verify, so nothing to cite. |

This page is pure hype with no claim. It is also highly extractable in the wrong sense: a competitor
copies it in five minutes because it says nothing only this company knows. It will never be quoted.

### After (the rewrite, citation-ready)

> ## How long does EU novel-food approval take?
>
> An EU novel-food authorisation runs roughly 28 months from a valid submission to publication of the
> authorising act, based on a 2025 analysis in npj Science of Food that found an average of about
> 2.56 years (Nature, 2025). The statutory core is shorter, an EFSA safety opinion of about nine
> months plus a Commission implementing act of about seven, but data requests routinely extend it.
>
> ### What drives the variance?
>
> The 28-month figure is an average, not a guarantee. The single largest driver of delay is the
> EFSA "stop-the-clock" data request: when the dossier lacks a toxicological endpoint or a stability
> dataset, the clock pauses until you supply it, and a thin dossier can add a year. The mechanism
> matters because it is controllable: a complete dossier at submission is the only lever that moves
> the timeline, and it is the one a generalist consultant underbuilds.
>
> ### What a complete dossier covers
>
> 1. Identity and production process, characterised to the assay.
> 2. Compositional and stability data across the shelf life claimed.
> 3. Toxicological profile sufficient for the intended intake.
> 4. Allergenicity assessment against the EU framework.
>
> [Dr name], who has filed [N] dossiers under Regulation (EU) 2015/2283, notes that the failures
> cluster in step 3: the intake estimate and the toxicology do not match, and the clock stops.

Why the rewrite wins the citation: the heading is the literal query, the first sentence answers it
with a number and its source, the mechanism is named and controllable, and the expert claim carries
a name. An engine answering "how long does EU novel-food approval take" can lift the first sentence
verbatim and attribute it with confidence. The depth underneath is what a thin competitor cannot
fake, so it becomes the distribution advantage, not the filler.

Note the provenance discipline: every figure here traces to a real, web-checkable source. Before
publishing, the founder confirms the npj figure and the statutory components against the current
regulation and a qualified professional, because the same sentence sharp enough to quote is the
sentence a regulator can quote back.

## Anti-patterns and their fixes

| Anti-pattern | Why it loses the citation | Fix |
| --- | --- | --- |
| **Hype with no claim** | A page of adjectives gives the engine nothing to lift. | Replace every adjective with a number, a named mechanism, or a sourced fact. |
| **Walls of prose** | The answer is buried in paragraph six; the model grabs an earlier source. | Lead every section with its standalone answer; one claim per chunk. |
| **Unsourced numbers** | A free-floating statistic reads as hallucination risk; the engine skips it. | Attach the source in the same sentence as the number. |
| **Marketing headings** | "Our Approach" matches no query, so it never surfaces. | Make each H2 the literal question a buyer types. |
| **Stale figures** | An old number undermines the freshness signal. | Date the page; carry the most recent verified figure. |
| **Narrative ahead of proof** | The engine repeats your overclaim to the next buyer you disappoint. | Close the gap: for each bold claim, name the proof you have and the proof you owe. |
| **Keyword stuffing** | Built to game a crawler, read as low-trust by a synthesiser. | Write for the model to quote accurately, not for density. |

## Copyable template: the GEO content brief

```
# GEO Content Brief: [page topic]

## North-star sentence
The one query: [exact buyer query]
The sentence I want quoted back: [standalone, names me or my category claim]

## Target queries (heading = query)
| Query | Format | Standalone opening sentence |
| --- | --- | --- |
| [query 1] | definitional / comparative / data-led / FAQ | [the liftable answer] |
| ... | ... | ... |

## Citation-factor checklist (per section, before publish)
- [ ] Clarity: opens with a self-contained sentence
- [ ] Structure: H2 is a buyer query; answer before depth
- [ ] Specificity: exact numbers, named mechanisms, zero hedge words
- [ ] Authority: every statistic sourced, every expert named
- [ ] Freshness: dated, most recent verified figure
- [ ] Provenance: boldest claim would survive my sector's regulator

## Narrative-evidence gap
| Bold claim | Proof I have | Proof I still owe |
| --- | --- | --- |
| [claim] | [dossier / data / source] | [what to ship next] |

## Measurement
Baseline Share of Model before publishing; re-score after, via share-of-model-audit.
```

---

*Reference for the `geo-content` skill. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL).
CC-BY-4.0.*
