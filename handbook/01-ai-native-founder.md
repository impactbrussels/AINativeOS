# 01. The AI-Native Founder in Hard-Mode Sectors

> **Thesis.** When building is cheap, judgement is the scarce input. Deep domain expertise in a regulated sector is the one advantage the AI giants cannot rent, and it is exactly what a horizontal model is built to lack.

## The shift

For a century the founder's constraint was people. More output meant more bodies, and the maths was brutal and simple: twice the customers wanted twice the support staff, twice the code wanted twice the engineers. Revenue and headcount climbed the same staircase, step for step, and everyone treated the arithmetic as a law of nature.

It was never a law. It was a limit of the tools, and the tools changed.

A small senior team with a frontier model and a set of agents now carries work that used to need a department. The first pass of a dossier, the literature scan, the data reconciliation, the pipeline monitoring: all of it runs through machines that do not sleep, do not need onboarding, and cost a subscription rather than a salary. So the link between adding people and adding output comes unbolted. Output scales. The org chart does not have to.

That is the reframe this chapter turns on. The founder's job is no longer "assemble the biggest team my round will buy." It is two sharper questions. What is the smallest senior core that can direct a machine to carry the load? And what, precisely, do you know that the machine never will? The second question decides everything in a regulated sector, and most founders never ask it.

Watch the trap a first-time founder walks into. They feel the old arithmetic in their bones, raise a big round, hire a department to match each box on a generic org chart, and spend the runway managing people instead of solving the problem. Eighteen months later they hold a burn rate, a hierarchy, and a product that a two-person team with the same domain knowledge and a stack of agents could have shipped in a quarter. The money did not buy speed. It bought coordination overhead, in an industry that punishes slow.

## The framework

Five ideas separate a lean AI-native company from an expensive one wearing the same logo.

1. **Decoupling headcount from revenue.** In a traditional business, throughput is a function of bodies, so a consultancy bills more by hiring more analysts and the line from headcount to revenue runs nearly straight. [Agents](../dictionary/03-tools-and-environment.md#agent) bend that line. When a network of them carries the throughput a team of juniors used to carry, you take on more work without hiring in proportion, and your margins improve as you grow rather than staying flat. Watch revenue per employee as a health metric: if it climbs while you scale, [decoupling](../dictionary/07-ai-native-business.md#decoupling-headcount-from-revenue) is real; if it stays flat while you add seats, you are an agency that bought GPUs.

2. **The One-Ten-Hundred shape.** Read this as an illustrative organisational model, an aspiration, never a guaranteed law and never a forecast. The shape is a senior core of fewer than ten people, each orchestrating agents, aiming at a scale that a team that size could never reach by hand. The revenue ambition is what becomes *thinkable* when each person directs a machine instead of managing a roomful of juniors. [One-Ten-Hundred](../dictionary/07-ai-native-business.md#one-ten-hundred) earns its keep as a design constraint: before you open a role, you ask whether this is a job for a person or a job for an agent under a person's supervision. Asked honestly and often, that question produces a radically leaner company than the default of mirroring a generic org chart.

3. **The founder as conductor.** A conductor plays nothing. They hold the score, set the tempo, hear the one section drifting flat, and stop the performance when it is wrong. That is the AI-native founder's day. You stop writing every line, running every search, reconciling every sheet. You become the person who scopes the work, points an agent network at it, reads the output with a sceptical eye, and decides two things no model decides for you: what should exist, and what must never ship. The metaphor carries two warnings on purpose. A conductor who blesses every note an agent plays might as well perform solo, because the latency cancels the leverage. A conductor who walks offstage gets noise. The craft is pitching your attention at the right altitude, and in hard mode that altitude sits lower than you would like. The typing moves to the machine. The judgement stays with you, and judgement was always the scarce part.

4. **Domain expertise as the wedge.** This is the heart of the chapter. A frontier model is trained on the open web, so it is roughly equally good, and equally generic, for everyone holding the same API key. The ability to write code, summarise a paper, or draft a passable email is cheap and universal now; a competitor buys the same capability at the same price on the same Tuesday. What the model cannot have is the knowledge that never reached the public internet: how a specific bioreactor fails in month three, which EFSA reviewer flags which dossier section, why a clinical workflow breaks at the exact handoff the textbook glosses over. When AI levels the technical playing field, that hard-won knowledge stops being a footnote and becomes the unfair advantage. It is scarce, useless to a generalist, and precisely what makes your product right where the generic model is confidently wrong.

5. **Agent-centric from day one.** Design the company around agents rather than retrofitting them onto a human-shaped org. An incumbent in food or health sits on data trapped in incompatible systems and processes built for thousands of people; they want agent-augmented workflows and cannot run them, because the plumbing fights back. You have no legacy to migrate. Build the data capture, the agent pipeline, and the human checkpoints into the foundation, clean, while a startup the right size still can. Agility is a design discipline you keep choosing, not a trait you keep.

## Why it holds

Three organisations, one pattern: depth where a generalist cannot safely go, with judgement held by a small senior core.

**OpenEvidence** is a purpose-built clinical search system, the closest thing medicine has to a trusted answer at the point of care. A physician asks a real clinical question and gets a response grounded in the literature rather than a generic web summary. It is widely reported as trusted and used by a large share of US physicians, at a multi-billion-dollar valuation [claimed in source]; see [SOURCES](SOURCES.md), and weigh the pattern over the digits. The pattern is the point. A general model asked a clinical question produces a fluent answer that is sometimes wrong, and in medicine "sometimes wrong, confidently" is disqualifying. OpenEvidence narrows hard onto one regulated field where the cost of error is high, which is exactly where a horizontal tool dares not go. That is [domain as wedge](../dictionary/07-ai-native-business.md#ai-native-vs-wrapper) made concrete.

**Recursion** runs the same logic at industrial scale in drug discovery. Automated lab cycles generate proprietary biology, the biology trains the models, the models choose the next round, and the defensible asset is the validated dataset the loop keeps producing. A competitor renting the same models cannot reproduce it without running the same years of experiments. The Brain is rentable. The accumulated, domain-specific data is not. Founded by Chris Gibson in 2013, the company built its edge on expertise plus proprietary data rather than on any model anyone could license; current figures and leadership are in [SOURCES](SOURCES.md).

**Impact Brussels** is the small AI-native nonprofit behind this handbook, run as a teal, self-managing organisation: no thick hierarchy, decisions pushed to whoever holds the context, agent-augmented operations carrying work a comparable body would staff with several hires. Research synthesis, monitoring of grant calls and regulatory developments, drafting, and the production of long-form artefacts like this very handbook run through agent networks under senior supervision rather than through a department per function. This is deliberately qualitative; inventing internal metrics would break the one rule the whole repo stands on. The lesson is that One-Ten-Hundred is not only a startup story. A mission-driven organisation with a tiny senior core and a clear domain edge, in this case EU regulatory work and food and health innovation, can operate well above its headcount, which means the model is not exotic. The teal structure and the agent networks are the same idea wearing different clothes: design the org so a handful of people directing machines do what used to take many. If a nonprofit can run this way, it is available to anyone willing to build clean from the start.

## In hard mode

Food, health, and deeptech are the sectors founders are told to avoid: too regulated, too slow, too expensive for a small team. Read the difficulty the other way. The thing that makes these sectors hard is the same thing that makes them defensible.

The domain knowledge here is not decoration. It is the EFSA authorisation pathway and the data request that quietly extends it by a year. It is the clinical validation that proves a consumer sensor is trustworthy enough to act on. It is the food science that tells you a fermentation batch is safe to ship, or is not, before a regulator ever sees it. None of that lives on the open web the models trained on. It lives in lab results, failed batches, regulator correspondence, and the heads of people who spent years in the work.

A horizontal model cannot rent it. It can produce a beautifully written, regulatorily wrong paragraph with total confidence, and only someone with the domain in their bones will catch the error. That catching is the wedge. So the harder the mode, the wider it opens: the regulation everyone treats as a barrier to you is also the barrier to the army of clones who would otherwise commoditise your idea the moment your demo shows them how.

There is a second trap waiting here, the inverse of the first. It is assuming the model already knows your domain because it answers fluently. Fluency is not accuracy. The smooth paragraph will talk you out of your one advantage if you let it, because it reads like competence and arrives in seconds, and it costs nothing to believe. Do not believe it. The premium on knowing what is actually true climbs with the stakes, and in food safety and clinical work the stakes are measured in recalls, rejected submissions, and hurt people.

If you have spent twenty-five years collecting scars in a regulated field, that experience is not baggage to apologise for. It is the moat. The machine handles the typing. You handle the one judgement that decides whether the typing was right.

## What it means for you

1. **Run the One-Ten-Hundred question on every role.** Before you open a req, write it down: is this a job for a person, or a job for an agent under a person's supervision? Classify each function as agent-run, human-run, or hybrid, and let the small headcount be the consequence of getting that right, not a target you hit by starving the team.

2. **Move yourself to the conductor's chair.** Stop hand-coding every feature and running every search. A founder who insists on executing has capped the company at one person's output. Develop the taste to know when an output is wrong, set your attention high enough that agents do real work and low enough that a bad output is caught before it reaches a customer.

3. **Name your wedge in one sentence.** Write the specific thing you know that a frontier model does not, and that a competitor cannot download. If you cannot finish that sentence, you do not yet have a domain edge; you have a technical idea in a crowded market.

4. **Keep the human checkpoint where error is costly.** Decouple the routine throughput and keep the judgement. The regulatory call, the safety sign-off, the relationship with a cautious buyer: those do not vanish because you bought a subscription. Over-cut the humans in food or health and you ship a verification gap straight to someone who can be hurt by it.

5. **Build agent-centric before the debt sets.** Design the data capture and the agent pipeline into the foundation now, while you are small enough to do it cleanly. The startup that grows carelessly accumulates its own silos within two years and becomes the slow incumbent it set out to beat.

## The test

Take the three functions you would otherwise make your first three hires. For each one, can you name the agent pipeline that runs it, the human checkpoint where your judgement must sign off, and the one function that should *not* be an agent at all? In a regulated sector there is almost always one, and naming it is the discipline that separates a lean company from a reckless one. Then answer the question underneath all of it: what do you know that the machine never will, and have you built the company so that knowledge is load-bearing? → Run `start-here` to diagnose your stage, then `frame-the-hypothesis` to turn your edge into a falsifiable bet. Stage: **Frame**.

---

*Chapter 01 of [Load-Bearing](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0. Prev: [00. What "AI-Native" Actually Means](00-introduction.md) · Next: [02. From Vague Idea to Testable Hypothesis](02-vague-idea-to-hypothesis.md).*
