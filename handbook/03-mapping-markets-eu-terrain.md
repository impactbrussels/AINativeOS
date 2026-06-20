# 03. Mapping Markets, Competitors & EU Terrain

> **Thesis.** In hard mode the binding constraint is the approval clock, not the tech. A dossier that takes the better part of three years to clear, or an EFSA opinion you cannot ship without, is a strategy input, not a footnote. Map the terrain and the wedge before you write a line of code, or you will build a beautiful product that arrives years late into a market someone else already framed.

## The shift

Most founders map the wrong terrain. They study the technology, the feature set, the competitor's landing page, the pricing tiers. Then they build, and they hit a wall that was never on their map: a regulator who needs eighteen months to read what they submitted, an opinion that has not been issued yet, a market that legally cannot open until a clock they do not control has finished ticking.

In easy mode you can get away with this. The market is open, entry is cheap, and the only race is to ship. In hard mode the race is different, and the starting gun has not fired. Food, health, deeptech: these sectors run on approvals, and an approval is a queue you join, not a task you complete. The queue has its own pace. It does not care about your roadmap.

So the first thing to map is not the competition. It is the clock. The approval timeline is the load-bearing fact of a hard-mode market, and everything else, your build plan, your runway, your sequence of bets, hangs off it. Get the clock wrong and the rest of the map is decoration.

This is where the new economics bite hardest, and where most founders misread their own advantage. AI collapsed the cost of building. It did nothing to the cost of waiting. So the part of the timeline you can now compress, the engineering, was never the part that decided whether you lived. The part that decides, the queue, is exactly the part AI cannot touch. Founders feel fast because the demo came together in a weekend, and they mistake that speed for progress against the only deadline that matters. It is not. A well-funded incumbent who knows how to wait out a regulator is more dangerous to you than a faster coder, because the incumbent is racing on the clock and the coder is racing on the thing the clock does not measure.

There is a second thing the old map misses. "We will be better" is not a strategy; it is a hope. The terrain you actually want is the gap: the specific place where the incumbent solves half the problem and leaves the other half to the customer, or where the manual cost is so high that a slow, expensive, human process is begging to be undercut. That gap is your wedge. Find it before you build, because a product built without a wedge is a product looking for a reason to exist after it launches.

This chapter is about reading the terrain before you commit to it. The clock, the wedge, and the discipline to point your machine at the right work.

## The framework

Four moves map a hard-mode market. Do them in order; the first one reorders everything after it.

1. **Regulatory-bottleneck mapping.** Approval time, not build time, sets your real timeline. Before anything else, find the longest queue between you and a paying customer and measure it in months. A Novel Foods dossier that runs roughly 28 months from submission to authorisation is illustrative of the order of magnitude [claimed in source]; the exact count varies by file and by year, and you must check yours. The mechanism is brutal and simple: you can compress build time to nearly zero with AI and it changes almost nothing, because the binding constraint sits in a process you do not own. So sequence your market entry around the clock. Start the dossier first. Build the product in the shadow of the queue, not the other way round.

2. **Wedge identification.** Find where incumbents only solve half the problem, or where a high manual cost makes them vulnerable. The wedge is a specific gap, not a vague "better". Antibiotic alternatives in animal farming, where regulatory pressure is rising and the incumbent answer is "use less and hope". Crop traits that take a decade to breed by hand. A trends desk that ships a quarterly report when the buyer needs the signal this week. Each of those is a named hole, and the size of the hole is the size of your opening. If you cannot state the wedge in one sentence that names what the incumbent fails to do, you do not have one yet.

3. **Strategic discipline.** Point AI at the time-consuming, repetitive, low-creativity terrain work. Reading a 200-page dossier and pulling out the binding constraints. Mapping forty competitors and their regulatory filings into one table. Digesting an EFSA opinion down to the three sentences that change your plan. That work used to eat a senior analyst for a fortnight; an agent does the first pass in an afternoon. Keep human judgement for the high-stakes calls: which wedge to bet the company on, which regulatory risk is survivable, which competitor is closer to your door than they look. The machine digests. You decide. Confuse the two and you outsource the one job that is actually yours.

4. **Visibility is shifting.** Where buyers used to find you through a search engine, a growing share now arrive through an answer engine that cites a handful of sources and skips the rest. Being one of the cited sources is becoming a competitive surface in its own right. Note it here; it changes how a market gets discovered, and a competitor who is the model's default reference in your category starts every buyer conversation a step ahead of you. The full treatment, and how you actually move the needle, is chapter 10. For now, put it on the map and move on.

## Why it holds

Three companies show the framework working in real hard-mode markets. None is winning on raw model quality. Each is winning on terrain.

**Aquit** is a Chilean aquaculture biotech building AI for animal-antibiotic alternatives, and the wedge is the whole story. Antibiotic use in fish farming is under tightening pressure, and the resistance problem is a market gap the incumbents have no clean answer to. Aquit points a multi-omic platform at fish-native bioactive proteins that could replace those antibiotics, aiming straight at the hole regulation is opening up. The wedge is not "better aquaculture software". It is a specific, named, regulation-driven gap, and that specificity is what makes it defensible. *(Platform details: see [SOURCES](SOURCES.md).)*

**ScreenSys** runs AI-guided crop breeding inside one of the most regulated environments there is. Plant breeding is slow by nature: traits take years to fix, and the field is hemmed in by safety and approval rules. ScreenSys uses an AI-driven, single-cell breeding platform to compress the slow part, the screening, while operating fully inside the regulatory terrain rather than pretending it is not there. That is the discipline made concrete. The machine takes the repetitive screening work; the constraints stay respected because the team mapped them first. *(Platform details: see [SOURCES](SOURCES.md).)*

**Tastewise** sells real-time food-trend intelligence: a system that forecasts where consumer preference is heading instead of reporting where it has been. The wedge is the lag. A traditional trends report is a snapshot of last quarter, and by the time a brand acts on it the signal is stale. Tastewise undercuts that with live intelligence, turning a high manual cost, teams of analysts assembling a slow document, into a feed. Its clients are reported to include Nestlé and Mars, which tells you the gap was real enough that large incumbents pay to close it [claimed in source]. *(Client list and platform: see [SOURCES](SOURCES.md).)*

Read across the three and the pattern is one pattern. The model is rented. The terrain is owned. Each company found a regulation-shaped or cost-shaped gap, pointed AI at the slow repetitive work around it, and kept human judgement on the bet. That is the framework, not as theory, but as three real companies operating in markets where the clock is the constraint.

## In hard mode

This is where the approval clock stops being a metaphor and becomes a line in your plan.

EU Novel Foods and EFSA timelines are a strategy input. Not a compliance afterthought you handle once the product works, but a number you put at the top of the page before you decide what to build. If the queue is two years and your runway is eighteen months, you have not designed a product. You have designed a way to run out of money before the market opens. The sequence has to start with the dossier, because the dossier is the long pole, and every other task fits inside the time the queue gives you for free.

A worked example makes the reordering obvious. Say a precision-fermentation protein needs Novel Foods authorisation before a single euro of revenue is legal. The old instinct is to perfect the molecule, raise on the demo, then think about the pathway. Run the framework instead and the plan inverts. The clock goes first: file early, in parallel with the science, so the queue and the build burn down together rather than back to back. The wedge goes second: not "a cleaner protein" but the named gap, the incumbent ingredient this replaces and the specific cost or claim it cannot match. The terrain work goes to the machine: an agent reads the prior authorisations in your category, finds the data requirements that sank earlier applicants, and hands you the failure modes before you repeat them. You keep the call on which battles to pick. The order is the strategy. Get it backwards and the science being real will not save you.

Here is where AI earns its place in the mapping work. The regulatory terrain is enormous and largely text: dossiers, opinions, guidance documents, competitor filings, the public record of who applied for what and when. A founder cannot read all of it, and a junior analyst reads it slowly and misses things. An agent with a [rag](../dictionary/02-context-and-sessions.md#rag-retrieval-augmented-generation) layer over the corpus can digest the lot into a regulation-aware market-entry map: who is in which queue, how long each step has historically taken, where an EFSA opinion already exists that you can build against, and where the gap between filings is wide enough to walk through. Mind the [knowledge-cutoff](../dictionary/01-the-model.md#knowledge-cutoff) here. A general model knows nothing about the opinion published last month, so you ground it on the live record. You do not trust its memory.

Then you sequence around the clock. The map tells you the longest queue; you join it first. The map tells you which competitor is already two steps into the approval process; you decide whether to race them or route around them. The [agent](../dictionary/03-tools-and-environment.md#agent) does the reading and the mapping. You do the sequencing, because the sequencing is the bet, and the bet is the part no model should make for you.

One more thing the regulatory record quietly builds, if you let it: a [vertical-data-moat](../dictionary/07-ai-native-business.md#vertical-data-moat). Every dossier you digest, every opinion you map, every filing you track is an asset that compounds. A competitor renting the same model starts from the same blank page you started from. You need not. Chapter 14 develops the moat; for now, notice that the terrain work and the moat are the same work, done early.

## What it means for you

1. **Find the clock and put it at the top of the page.** Before you scope a single feature, identify the longest approval queue between you and a paying customer, and measure it in months. If you cannot name that number, you are not ready to build. You are ready to research.

2. **Write the wedge in one sentence.** Name the specific thing the incumbent fails to do, or the manual cost they cannot shake. If the sentence comes out as "we will be better", you have not found the wedge; you have found a slogan. Keep digging until it names a hole.

3. **Point the machine at the terrain work, not the judgement.** Use an agent to digest dossiers, map competitors, and pull regulatory filings into one regulation-aware map. Keep the high-stakes calls, which wedge, which risk, which sequence, on your side of the line. Automate the reading. Own the deciding.

4. **Sequence the build around the queue, not the queue around the build.** Start the dossier first. Plan the product to be ready when the clock finishes, not before, not years after. The team that finishes building early and then waits two years for approval has lost as surely as the team that ships late.

5. **Note where the model points buyers.** Check whether the answer engines already have a default reference in your category, the early signal of [geo-generative-engine-optimization](../dictionary/07-ai-native-business.md#geo-generative-engine-optimization) and your [share-of-model](../dictionary/07-ai-native-business.md#share-of-model). If a competitor is the cited source, that is a gap on your map too. Park the work for chapter 10, but do not pretend it is not there.

## The test

Take the market you would enter tomorrow. Answer one question, out loud, with a real number: *what is the longest approval clock between me and my first paying customer, and have I sequenced my entire build around it, or am I still planning as if build time were the constraint?* If you cannot say the number, or if your plan ignores it, you are mapping the wrong terrain. → Run `map-the-terrain`.

---

*Chapter 03 of [Load-Bearing](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0. Prev: [02. From Vague Idea to Testable Hypothesis](02-vague-idea-to-hypothesis.md) · Next: [04. Customer Discovery That Doesn't Lie](04-customer-discovery.md).*
