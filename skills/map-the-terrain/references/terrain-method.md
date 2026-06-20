# Terrain Method: The Clock, the Wedge, the Citation Surface

The full mapping method for hard mode. The binding constraint is the approval clock, not the tech. AI
collapsed the cost of building and did nothing to the cost of waiting, so the part you can now compress
was never the part that decided whether you lived. Map the clock and the wedge before a line of code, or
you ship a beautiful product years late into a market someone else already framed. This file expands the
four moves, gives the wedge rubric, and walks one terrain map end to end.

## The four moves, in order

The first move reorders everything after it.

| # | Move | What it produces | Why it leads |
|---|------|------------------|--------------|
| 1 | Map the approval clock | The longest queue to a paying customer, in months | It sits in a process you do not own; it sets the real timeline |
| 2 | Find the wedge | One sentence naming the incumbent's failure | "Better" is a slogan; a wedge is a named hole |
| 3 | Point AI at the terrain | A regulation-aware map of queues, filings, data gaps | The record is huge and textual; the machine reads, you decide |
| 4 | Scan the citation surface | Who the answer engines cite in your category | A default reference starts every buyer conversation ahead of you |

## Move 1: the approval clock

Find the longest queue between you and legal revenue: an EFSA opinion, a Novel Foods dossier, clinical
validation, a CE mark. Measure it in months and put that number at the top of the page. Then sequence
entry around it: start the dossier first, build in the shadow of the queue, so the two burn down together
rather than back to back. If you cannot name the number, you are not ready to build. You are ready to
research.

Treat every duration as an assumption to verify against the live record and a qualified professional,
not a benchmark to plan against. As a rough order of magnitude only, an EU Novel Foods authorisation is
sometimes cited at roughly 28 months from submission [assumption to verify], with the statutory pieces
(an EFSA opinion of around nine months plus a Commission act of around seven months) routinely extended
by data requests. Mind the model's knowledge cutoff: it knows nothing about an opinion published last
month, so ground it on the current record and verify yours.

## Move 2: the wedge rubric

A wedge is the specific place where the incumbent solves half the problem and leaves the rest to the
customer, or where a manual cost is so high a slow human process is begging to be undercut. Score a
candidate wedge against four tests. A wedge that fails any one is a slogan.

| Test | Pass | Fail |
|------|------|------|
| **Named** | It names what the incumbent fails to do. | "We will be better." |
| **Specific** | One sentence, one hole, no list. | A bundle of vague advantages. |
| **Durable** | The hole stays open as you grow into it. | A free feature the incumbent ships next quarter. |
| **Regulation- or cost-shaped** | Backed by a rising rule or a high manual cost. | A taste preference with no structural force. |

Keep digging until the sentence names a hole. "Antibiotic alternatives in fish farming, where tightening
rules leave the incumbent answer at use less and hope" passes all four. "A cleaner protein" passes none.

## Move 3: point AI at the terrain

The regulatory record is enormous and largely text: dossiers, prior authorisations, opinions, guidance,
competitor filings. Put a long-context model with a retrieval layer over the corpus and have it digest
the lot into one map: who is in which queue, how long each step has historically taken, what data
requirements sank earlier applicants, where the gap between filings is wide enough to walk through. The
machine reads. You decide which wedge, which risk, which sequence. Confuse the two and you outsource the
one job that is yours. Every dossier you digest also compounds into a vertical data moat a rival renting
the same model starts without.

## Move 4: GEO versus SEO

Buyers used to arrive through a search engine that returned ten blue links and let them choose. A growing
share now arrive through an answer engine that cites a handful of sources and skips the rest. The surface
moved, and so did the work.

| | SEO (the old surface) | GEO (the new surface) |
|---|----------------------|------------------------|
| Buyer path | Searches, scans a page of links, picks | Asks, reads one synthesised answer with a few citations |
| What you optimise | Ranking on a results page | Being one of the cited sources in the answer |
| Winner-take-most | Top three links share clicks | The default reference frames the whole category |
| Your terrain task | Note keywords | Mark who the engine cites for your buyer's queries |

For now, mark it on the map: which buyer queries the engines answer in your category, and who they cite.
A competitor who is the model's default reference begins every buyer conversation a step ahead. Park the
full treatment for the GEO skill.

## Worked terrain map

A founder building a precision-fermentation protein for the EU market.

- **Clock.** Novel Foods authorisation is required before a single euro of revenue is legal. The longest
  queue, not the science, sets the timeline; treat the duration as an assumption to verify against the
  current regulation and a regulatory professional [assumption to verify]. Sequence: file early, in
  parallel with the science, so the queue and the build burn down together.
- **Wedge.** Not "a cleaner protein". The named hole: the incumbent animal-derived ingredient this
  replaces carries a cost or a claim it cannot match under tightening rules. One sentence, one hole,
  regulation-shaped. It passes the rubric.
- **Terrain (AI-read).** An agent digests prior authorisations in the category and surfaces the data
  requirements that sank earlier applicants, plus which competitor is already two steps into the queue.
  You decide whether to race them or route around them.
- **Citation surface.** Check which buyer queries the answer engines cover for this ingredient class and
  who they cite. If a competitor is the default reference, that is a gap on the map too.
- **Verdict.** The order is the strategy. File first, build in the shadow, attack the named hole, ground
  the model on the live record. The science being real will not save a plan that ignores the clock.

Verified hard-mode patterns to study, not to copy: **Aquit** points a multi-omic platform at the
regulation-driven gap in antibiotic alternatives for aquaculture; **ScreenSys** runs AI-guided crop
breeding fully inside the approval terrain rather than pretending it is not there; **Tastewise** undercuts
the lag of a quarterly trends report with live intelligence; **Nuritas** reframes peptide discovery as a
search so the wet lab only ever runs on pre-ranked candidates. Each owns the terrain and rents the model.
Figures for any of these are claims to verify in `handbook/SOURCES.md`, not facts to repeat.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| Inventing the TAM | A confident market-size number with no source, used to justify the build. | Never state a market figure as fact; label it an assumption to verify, or leave it out. |
| Ignoring the clock | Planning as if build time were the constraint, then hitting a two-year queue. | Put the longest approval queue, in months, at the top of the page and sequence around it. |
| Mapping competitors, not wedges | A tidy table of forty rivals and their features, but no named hole to attack. | Stop at the gap. The map exists to find the wedge, not to admire the landscape. |
| Trusting the model's memory | Asking a general model for the current regulatory state and printing the answer. | Ground it on the live record; mind the knowledge cutoff; verify with a professional. |
| Outsourcing the judgement | Letting the agent pick the wedge and the sequence because it read the dossiers. | The machine reads; you decide which wedge, which risk, which sequence. |

## Copyable template

```
TERRAIN MAP: [PRODUCT]
Domain: [DOMAIN]   Customer: [ICP]   Problem: [PROBLEM]   Binding limit: [CONSTRAINT]

1. APPROVAL CLOCK
   Longest queue to a paying customer: ____________  ~[ ] months  [assumption to verify]
   Sequence around it: __________________________________________

2. THE WEDGE (must pass all four)
   One sentence naming the incumbent's failure: ____________________
   Named [ ]  Specific [ ]  Durable [ ]  Regulation/cost-shaped [ ]

3. TERRAIN (AI-read, you decide)
   Who is in which queue: _______________________________________
   Data requirements that sank earlier applicants: _______________
   Gap wide enough to walk through: _____________________________

4. CITATION SURFACE
   Buyer queries the engines answer: ____________________________
   Who they cite (default reference?): __________________________

NEXT: run architect-before-code
```
