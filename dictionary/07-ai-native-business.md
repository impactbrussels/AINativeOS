# AI-Native Business

These are the words that separate an AI-native company from an AI feature: the strategy, the metrics, and the moat. A wrapper bolts a model onto an existing product; a native company is built so that intelligence is load-bearing and the system gets better the more it is used. If you read one category in this dictionary, read this one.

### AI-native vs wrapper

The distinction between a company whose intelligence is load-bearing and compounds with use, and a thin UI placed over a single model call that a competitor could clone in a weekend.

A wrapper sends a prompt to an off-the-shelf model and renders the reply. Nothing accrues. Every customer gets the same generic intelligence the next startup can buy with the same API key, so the only defensible asset is your marketing budget. AI-native means the model sits inside a loop: it touches proprietary data, captures the outcome of each interaction, and feeds that back so next month's product is sharper than this month's. Take a real AI-native company apart and you find a [data flywheel](#data-flywheel), an [eval](06-evaluation-and-safety.md#eval) suite, and a workflow that breaks without the model.

What this means for your work: ask what *compounds*. If usage leaves no residue, no improving dataset, no sharpening [memory system](02-context-and-sessions.md#memory-system), no widening domain edge, you have a wrapper with good PR. Wrappers can still make money for a while. They just can't defend it.

_Avoid:_ calling yourself "AI-native" because you use an LLM. Using AI is table stakes; *compounding* with it is the bar.

_Usage:_
> "Their demo is slick, but it's a wrapper: one Claude call and a Stripe button. We're native because every correction our users make retrains the routing layer."

Related: [The Remove-the-AI test](#the-remove-the-ai-test), [Data flywheel](#data-flywheel), [Extractability](#extractability)

### The Remove-the-AI test

The repo's central diagnostic: mentally delete the AI from your product, and see whether anything of value remains.

Pull the model out. If the product still does its core job, the spreadsheet still calculates, the CRM still stores contacts, the dashboard still charts, then AI was a feature, a nice garnish on a business that stands on its own. If the product collapses into a blank screen because the intelligence *was* the product, you have built something AI-native. The test cuts through every pitch deck: it doesn't care what you call yourself, only what falls over when the model is gone.

What this means for your work: run this test on your own roadmap before an investor runs it on you. It's uncomfortable on purpose. Most "AI features" survive removal, which is exactly why they don't command AI-native multiples or defend against the incumbent who ships the same feature next quarter.

_Avoid:_ treating a passing grade as a verdict on quality. A feature surviving removal isn't bad. It just isn't a moat, and shouldn't be priced like one.

_Usage:_
> "Run the remove-the-AI test on it. Strip the model and you've got a Notion clone. That's a feature, not a company."

Related: [AI-native vs wrapper](#ai-native-vs-wrapper), [Extractability](#extractability), [Vertical data moat](#vertical-data-moat)

### Data flywheel

A loop in which using the product generates proprietary data that makes the product better, which attracts more use, which generates more data.

This is the engine under every durable AI-native company. The mechanics: a user does the work, the system captures the outcome (what was accepted, corrected, abandoned), and that signal sharpens the next response. Spin it long enough and you hold a dataset no competitor can buy, because it was minted by your specific users solving your specific problem. The flywheel is heavy to start, early on you have no data and a mediocre product, and brutal to catch once it's turning, which is the whole point of a moat.

What this means for your work: design the capture loop on day one, not after launch. The trap is building the product and bolting on analytics later; by then you've thrown away the corrections that were your most valuable asset. Decide *now* what signal each interaction should leave behind.

_Avoid:_ confusing "we collect a lot of data" with a flywheel. A data lake that doesn't feed back into the product is a storage bill, not a loop.

_Usage:_
> "Our flywheel is the rejection data. Every time a user rewrites our draft, we learn the house style faster than any competitor starting cold."

Related: [Vertical data moat](#vertical-data-moat), [AI-native vs wrapper](#ai-native-vs-wrapper), [Extractability](#extractability), [memory system](02-context-and-sessions.md#memory-system)

### Minimum Viable Agent (MVA)

The smallest autonomous loop that delivers real value end-to-end: the agentic answer to the Minimum Viable Product.

Where an MVP is the leanest *product* you can put in front of users, an MVA is the leanest *agent*: one job, done autonomously, start to finish, with a human checkpoint where the cost of error is high. Resist the urge to ship a fleet. Pick a single task, triage these tickets, reconcile these invoices, draft these replies, and make one [agent](03-tools-and-environment.md#agent) do it reliably before you add a second. Reliability on one narrow loop teaches you more than breadth across ten flaky ones.

What this means for your work: scope your first agent to a task you can fully [eval](06-evaluation-and-safety.md#eval), with a [human-on-the-loop](04-agentic-patterns.md#human-on-the-loop-hotl) catching the tail risk. Ship it, measure it, earn the right to widen the mandate.

_Avoid:_ confusing MVA with "a chatbot." An MVA acts and completes a task; a chatbot answers and hands the work back to you.

_Usage:_
> "Don't pitch me the autonomous back office. What's the MVA: the one loop that runs unattended on day one and we can prove works?"

Related: [The Goldilocks zone](#the-goldilocks-zone), [agent](03-tools-and-environment.md#agent), [human-on-the-loop](04-agentic-patterns.md#human-on-the-loop-hotl)

### The Goldilocks zone

The band of tasks worth automating with an agent: hard enough that automation creates real value, easy enough that today's models do them reliably.

Too easy and a script or a form already solves it: paying for inference is waste. Too hard and the model fails often enough that supervision costs more than doing the work yourself. The zone in between is where AI-native businesses live: tasks with enough judgement that rules can't capture them, but enough structure that a well-scoped agent clears the bar. The zone moves outward every time models improve, so yesterday's "too hard" becomes tomorrow's product.

What this means for your work: audit your roadmap against the band honestly. The "too easy" tasks are a margin trap dressed up as innovation; the "too hard" tasks burn trust and budget on a [verification deficit](05-failure-modes.md#verification-deficit) you can't close. Build in the middle, and keep a watchlist of "too hard" tasks to revisit each model release.

_Avoid:_ assuming the zone is fixed. It expands with model capability. Re-test the edges every few months instead of writing tasks off permanently.

_Usage:_
> "Auto-categorising expenses is too easy, and full audit defence is too hard right now. The Goldilocks zone is the grey-area receipts a junior would flag: that's our wedge."

Related: [Minimum Viable Agent (MVA)](#minimum-viable-agent-mva), [verification deficit](05-failure-modes.md#verification-deficit), [eval](06-evaluation-and-safety.md#eval)

### One-Ten-Hundred

An illustrative organisational model: fewer than ten senior people, orchestrating networks of agents, aiming at $100M+ in revenue.

The shape is the point. The "one-ten" is a tiny core of senior operators who design, supervise, and correct rather than execute. The "hundred" is the revenue ambition that headcount alone could never reach, made conceivable when each person directs a network of [agents](03-tools-and-environment.md#agent) instead of managing a team of juniors. It's the visible form of [decoupling headcount from revenue](#decoupling-headcount-from-revenue): a company that scales output without scaling org chart.

What this means for your work: treat One-Ten-Hundred as an aspirational target and a design constraint, not a promise. It pressures you to ask, for every hire, "is this a job for a person or a job for an agent under a person's supervision?" It does *not* guarantee the outcome: most companies won't hit it, and pretending the model is a law is how you under-staff the work that genuinely needs humans.

_Avoid:_ quoting it as a proven law or a financial projection. It's a directional model: no verified company numbers attach to it. Senior judgement, [evals](06-evaluation-and-safety.md#eval), and supervision are the load-bearing parts, not the headcount.

_Usage:_
> "We're designing this One-Ten-Hundred from the start: eight people, agent networks doing the throughput. Whether we hit nine figures is unproven, but it shapes every hiring call."

Related: [Decoupling headcount from revenue](#decoupling-headcount-from-revenue), [agent](03-tools-and-environment.md#agent), [human-on-the-loop](04-agentic-patterns.md#human-on-the-loop-hotl)

### Decoupling headcount from revenue

Breaking the historical link between adding people and adding output, so a company can grow its top line without growing its org chart at the same rate.

In a traditional services business, more revenue means more people: the line between headcount and output is nearly straight. AI-native economics bends it. When agents carry throughput a team once carried, you can take on more work without proportional hiring, and your unit economics improve as you scale instead of staying flat. The senior people who remain shift from doing the work to directing and verifying it.

What this means for your work: watch revenue-per-employee as a primary health metric, not a vanity stat. If it climbs as you grow, the decoupling is real; if it's flat, you're an agency that bought GPUs. Reinvest the freed capacity into the [data flywheel](#data-flywheel) and supervision quality, not into headcount you no longer need.

_Avoid:_ reading this as "fire everyone." The senior core gets more leverage, not smaller importance, and over-cutting humans is how you ship a [verification deficit](05-failure-modes.md#verification-deficit) straight to customers.

_Usage:_
> "Revenue doubled and we added one person. That's the decoupling working: last year that growth would've meant fifteen hires."

Related: [One-Ten-Hundred](#one-ten-hundred), [Data flywheel](#data-flywheel), [verification deficit](05-failure-modes.md#verification-deficit)

### GEO (Generative Engine Optimization)

The practice of optimising your content and presence to be *cited inside AI-generated answers*, ChatGPT, Perplexity, Claude, rather than to rank in a list of links.

SEO won you a blue link on a results page a human then chose to click. GEO wins you a sentence inside the answer the engine writes, often with no click at all. The unit of victory changes from rank to citation: the engine reads the web, synthesizes a reply, and names a handful of sources. You want to be one of them. That rewards clear, structured, quotable, genuinely-useful content the model can lift cleanly, and it punishes keyword-stuffed pages built to game a crawler.

What this means for your work: as buyers shift their research from Google to AI engines, the answer box becomes your top of funnel. Write so a model can quote you accurately and attribute you by name. Structure claims, cite your own evidence, and make your expertise extractable in a sentence.

_Avoid:_ treating GEO as "SEO with new keywords." The mechanism is citation inside synthesis, not ranking in a list: different optimisation, different content.

_Usage:_
> "Half our buyers now start in Perplexity, not Google. GEO is how we show up in that answer, and [Share of Model](#share-of-model) is how we'll measure whether it's working."

Related: [Share of Model](#share-of-model), [RAG](02-context-and-sessions.md#rag-retrieval-augmented-generation), [hallucination](05-failure-modes.md#hallucination)

### Share of Model

The percentage of an AI engine's answers to your buyers' real questions that cite *you* versus your competitors: the new top-of-funnel metric.

Share of voice measured how often your brand appeared across media. Share of Model measures how often you appear inside the AI answer when a buyer asks a question in your category. Run your customers' actual queries through ChatGPT, Perplexity, and Claude; count how often each answer names you, names a rival, or names neither. That ratio is your visibility in the channel where decisions increasingly start, and unlike ad impressions, it's earned through being the source a model trusts to be right.

What this means for your work: Share of Model is the metric [GEO](#geo-generative-engine-optimization) moves. Track it monthly across the engines and the queries that matter to your buyers, the same way you once tracked keyword rankings. A rising share means your content is becoming the category's reference; a falling one means a competitor is being cited in the rooms you can't see.

_Avoid:_ confusing it with share of voice or generic "brand mentions." Share of Model is specifically about *citation in AI-generated answers* to buyer-intent queries, measured per engine.

_Usage:_
> "Our Share of Model on 'precision fermentation regulatory' queries went from one-in-ten answers to four-in-ten this quarter. That's the GEO work compounding."

Related: [GEO (Generative Engine Optimization)](#geo-generative-engine-optimization), [hallucination](05-failure-modes.md#hallucination), [RAG](02-context-and-sessions.md#rag-retrieval-augmented-generation)

### Extractability

How easily the value your product delivers can be lifted out and reproduced by a competitor or by the underlying model itself.

Everything you build sits somewhere on an extractability scale. A clever prompt is highly extractable: a screenshot reveals it, and a rival pastes it into their own app by lunch. A proprietary dataset minted by years of your users' corrections is low-extractability: there's nothing to copy, because the asset *is* the accumulated, private history. Your defensibility is roughly the inverse of your extractability: the easier your edge is to lift, the shorter your lead.

What this means for your work: audit every part of your product for what a competitor would need to replicate it. The parts that are just prompts and UI will be commoditised. Assume it and don't over-invest there. Concentrate your effort on the low-extractability core: the [vertical data moat](#vertical-data-moat), the [data flywheel](#data-flywheel), the domain integration no API key buys. Worse still, the model vendor can absorb a thin layer into the next release; build above what they'll commoditise.

_Avoid:_ assuming a feature lead is a moat. If it's high-extractability, it's a head start with an expiry date, not a defence.

_Usage:_
> "The summarisation is high-extractability: anyone can build it. Our moat is the labelled outcomes only our users could've generated. Pour the budget there."

Related: [Vertical data moat](#vertical-data-moat), [Data flywheel](#data-flywheel), [The Remove-the-AI test](#the-remove-the-ai-test)

### The 40% rule (Sean Ellis test)

A product-market-fit signal, attributed to Sean Ellis: ask users how they'd feel if they could no longer use your product, and you have PMF when more than 40% answer "very disappointed."

The genius is the wording. "Would you recommend us" invites polite inflation; "how disappointed would you be without us" forces an honest measure of dependence. Ellis found, across many startups, that the ones that went on to grow strongly clustered above the 40% "very disappointed" threshold, and those below it tended to struggle no matter how they tweaked. The number isn't magic, but the threshold is a useful, battle-tested line for "do people actually need this."

What this means for your work: run the survey before you pour fuel on growth. Below 40%, marketing spend just rents you users who leave; the fix is the product, not the funnel. Above it, you've earned the right to scale. Segment the responses: often a sub-group is wildly over 40% and that's your real beachhead.

_Avoid:_ treating 40% as a precise scientific constant. It's an empirical heuristic from Ellis's survey work, not a law of nature. Use it as a strong signal, not a pass/fail gate.

_Usage:_
> "Only 28% said 'very disappointed' overall: below Ellis's 40% line. But among regulatory consultants it was 61%. That segment is our PMF; aim there."

Related: [Minimum Viable Agent (MVA)](#minimum-viable-agent-mva), [The Goldilocks zone](#the-goldilocks-zone), [eval](06-evaluation-and-safety.md#eval)

### Vertical data moat

A defensible advantage built from proprietary data inside one narrow domain: data that is hard to get, expensive to label, and useless to a generalist.

Horizontal models are trained on the open web, so they're roughly equally good (and equally generic) for everyone. The edge in an AI-native business comes from going *narrow and deep*: the failure modes of one type of bioreactor, the precedents of one regulatory regime, the corrected outputs of one profession. This data rarely exists on the public internet, so the frontier model can't have learned it, and your product, fed by it, answers questions the generalist gets confidently wrong.

What this means for your work: pick a vertical where the valuable data is scarce, private, and accumulated through real operation, then build the [data flywheel](#data-flywheel) that mints more of it from every customer. Depth in one domain beats shallow coverage of ten; the moat is the thing the big lab won't bother to replicate because the market looks too small to them and is exactly right-sized for you.

_Avoid:_ thinking "more data" is the moat. Volume of generic data is commodity; the moat is *scarce, domain-specific, hard-won* data a generalist can't obtain.

_Usage:_
> "Our vertical data moat is fifteen years of EFSA dossier outcomes. No frontier model has that: it never touched the public web."

Related: [Data flywheel](#data-flywheel), [Extractability](#extractability), [Data consortium](#data-consortium), [RAG](02-context-and-sessions.md#rag-retrieval-augmented-generation)

### Data consortium

A pooling arrangement in which several organisations contribute proprietary data into a shared, governed resource, so each gets a model better than any could train alone.

No single mid-size player owns enough specialised data to match a giant. A consortium changes the math: pool the contributions under clear governance, and the collective dataset crosses the threshold where a genuinely strong domain model becomes possible. Each member trades some exclusivity for a capability none could build solo: useful when the competitor isn't the org next to you in the pool, but the trillion-dollar lab outside it. Governance is the whole game: who can see what, who owns the model, how value flows back, what stays private.

What this means for your work: a consortium can manufacture a [vertical data moat](#vertical-data-moat) at industry scale when you can't reach it alone: common in regulated sectors where data is fragmented across many cautious holders. Enter with the rules written down first. The structures that fail are the ones that hand-wave governance and discover the conflicts after the data is mixed.

_Avoid:_ confusing a consortium with "everyone shares everything." It's *governed, selective* pooling with explicit terms: the governance is the product, not an afterthought.

_Usage:_
> "Eight protein startups can't each out-data the incumbent. A data consortium gets us a shared model, if we nail the governance before anyone uploads a single file."

Related: [Vertical data moat](#vertical-data-moat), [Data flywheel](#data-flywheel), [The Six-Pillar Trust Substrate](06-evaluation-and-safety.md#the-six-pillar-trust-substrate)

---

*Part of [The Dictionary of AI-Native](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
