# Worked Example: One Company Through the Whole Arc

> **This company is fictional.** "FermentGuard" does not exist. It is a teaching device, invented to
> walk the AI-Native OS build arc end to end. Every name, number, and outcome below is illustrative.
> No real company, person, or figure is fabricated here: the few real reference points (the Sean Ellis
> 40% test, the rough EU novel-food cycle) are already verified in
> [handbook/SOURCES.md](../handbook/SOURCES.md) and are used only as patterns, not as claims about
> FermentGuard.

This is the capstone. Read the [Handbook](../handbook/) for the why and each
[skill](../skills/) for the how. This file shows the arc in one continuous story: which skill, flow,
loop, or agent runs at each stage, the artefact it leaves behind, and how that artefact becomes the
input to the next stage. The point worth your attention is in the middle, at Trust, where an eval
fails and the arc bends backwards. The arc is not a line. A demo is not evidence.

## The premise

FermentGuard is a precision-fermentation contract manufacturer. It brews novel proteins for food
brands, and before any batch ships it has to clear a release decision: is this batch safe and
compliant under EU Novel Foods rules, given the strain, the process logs, and the regulator's prior
opinions? Today a senior food-safety lead reads the batch dossier by hand. It takes a day per batch.
The bet: an AI-native system that reasons over every prior batch and every regulator response, makes
the release recommendation, and gets sharper with each batch it sees.

Hard mode on purpose. A wrong release recommendation is a recall or a hospital visit, not a
screenshot. That single fact shapes every stage that follows.

---

## Frame

**Run [start-here](../skills/start-here/SKILL.md).** It asks where the founder is, runs the
Remove-the-AI test on the idea, and routes to one next skill. FermentGuard's answer to the test:
remove the AI and you are left with a food-safety lead and a folder of PDFs, no product. What breaks
is made of the firm's own batch history and its regulator correspondence, which a competitor cannot
buy. That passes the test. `start-here` routes to `frame-the-hypothesis`.

**Run [frame-the-hypothesis](../skills/frame-the-hypothesis/SKILL.md).** It turns the idea into a
falsifiable bet. *Artefact: a hypothesis card.* The sharp version: *senior food-safety leads at
contract fermenters will hand the first-pass release recommendation to an agent, if it cites the
prior batch and the relevant opinion for every call, because the manual review is the bottleneck on
throughput.* That card names the riskiest assumption, the one that sinks everything if it is false:
that a regulated buyer will act on a machine's recommendation at all.

**Run [map-the-terrain](../skills/map-the-terrain/SKILL.md).** It scans competitors, substitutes, and
the regulatory ground. *Artefact: a terrain map.* It flags the live constraint: the EU novel-food
authorisation cycle runs to a couple of years per dossier (illustrative, see SOURCES), so the buyer's
real pain is throughput against a slow regulator, not speed for its own sake. That reframes the wedge.

**Run [customer-discovery-that-doesnt-lie](../skills/customer-discovery-that-doesnt-lie/SKILL.md),
paired with the [customer-proxy](../agents/customer-proxy.md) and the
[devils-advocate](../agents/devils-advocate.md) agents.** The skill runs discovery that hunts for
disconfirmation instead of applause; the devil's advocate forces every interview question to try to
refute the bet. *Artefact: a discovery log with a verdict.* Eight leads, and the finding that hurts:
they will not sign off blind. They will accept a recommendation only if a human stays on the final
release. That is not a setback. That is the human-on-the-loop boundary, discovered before code, and
it becomes a hard design constraint downstream.

**Frame feeds Architect:** the validated hypothesis card plus the human-on-the-loop constraint
becomes the spec the system is architected against. You do not architect a bet you have not sharpened.

---

## Architect

**Run [architect-before-code](../skills/architect-before-code/SKILL.md).** Write the system down
before generating it. *Artefact: a `SYSTEM-INVENTORY` from
[masterfiles/SYSTEM-INVENTORY-TEMPLATE.md](../masterfiles/SYSTEM-INVENTORY-TEMPLATE.md).* The four
pillars, named:

- **Brain.** A rented frontier model. No moat here, and FermentGuard does not pretend otherwise.
- **Memory.** The proprietary part: every prior batch dossier, every process log, every regulator
  opinion, versioned and immutable. This is what the giants cannot reach.
- **Planning.** A plan-then-act order, with a hard rule: any call touching an allergen, a dose, or a
  contamination threshold drops to a fixed, non-AI path. The fallback is designed in, not bolted on.
- **Tools.** Retrieval over the batch store, the LIMS read API, and a write to the release-decision
  log. Every call's blast radius named out loud.

The closed loop, written as one sentence first: *every release decision a food-safety lead confirms or
overturns is logged with its reasons and feeds back into Memory, so the next batch is judged against a
richer record.* That dotted return arrow is the flywheel. It is the line a competitor cannot copy.

**Run [cognitive-architecture-review](../skills/cognitive-architecture-review/SKILL.md).** It
pressure-tests the inventory before any agent touches the repo. *Artefact: a review with findings.* It
catches a gap: provenance is described but not enforced. The fix goes in now, while it is a design
choice and not an incident report.

**Run [write-the-claude-md](../skills/write-the-claude-md/SKILL.md).** The persistent memory beats a
clever prompt. *Artefact: a `CLAUDE.md` in the repo,* holding the principles, the human-on-the-loop
boundary, and the fallback thresholds, read at the top of every build session so each one starts where
the last stopped instead of guessing a new architecture into being.

The whole of Architect can be run as the [architecture-first-flow](../flows/architecture-first-flow.md),
which chains these three skills with checkpoints.

**Architect feeds Build:** the `SYSTEM-INVENTORY` is the contract the agents build against. Code is
generated against the inventory, never against a blank page.

---

## Build

**Run [agentic-build-loop](../skills/agentic-build-loop/SKILL.md).** Build with agents, specs and
tests over syntax, against the inventory. *Artefact: a working release-recommendation system,* with
the retrieval layer, the citation requirement, and the plan-then-act controller wired to the four
pillars. The daily cadence runs as the [daily-agent-standup](../loops/daily-agent-standup.md) loop, so
the build does not drift between sessions.

**Run [design-a-loop](../skills/design-a-loop/SKILL.md).** The flywheel arrow needs to be a real
mechanism, not a hope. *Artefact: a loop spec* (trigger, skill, state file, gate, stop condition,
escalation) plus the cost-per-accepted-change metric. The trigger: a confirmed or overturned release
decision. The gate: it only writes to Memory once a human has signed the final call. The flywheel is
now plumbing, not an aspiration on a slide.

**Build feeds Trust:** the moment the system can act, it can act wrongly. In a food-safety domain,
Trust does not wait at the end as a gate. It runs alongside the build.

---

## Trust, and the failure that bends the arc

**Run [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md), with the
[safety-judge](../agents/safety-judge.md) and [regulatory-proxy](../agents/regulatory-proxy.md)
agents.** Build the eval set before trusting the demo. *Artefact: a graded eval harness.* The set
includes fifty held-out historical batches with known outcomes, including the rare bad ones, plus
adversarial cases the safety judge writes.

The harness fails. Hard.

On four of the fifty batches, all four from one strain family, the system recommends **release** with
a confident, well-written justification. The historical record says those batches were **held** for a
contamination pattern. Worse, the system cites a real prior opinion that does not actually cover the
strain in question. The demo had looked excellent. Every batch in the demo happened to be a common
strain. The eval, by design, did not let it choose its own examples.

This is the whole reason the example exists. **A demo is not evidence.** The product worked in the
room and was wrong in the cases that could hurt someone.

**Run [red-team-the-agent](../skills/red-team-the-agent/SKILL.md), with the
[clinical-reviewer](../agents/clinical-reviewer.md) lens applied to food safety.** *Artefact: a
red-team report.* It finds the root cause, and it is not a prompt problem. The retrieval layer indexes
opinions by keyword overlap, so a rare strain with thin records pulls back the nearest common-strain
opinion and the Brain, asked to reason over it, rationalises a release. The fault is in the **Memory
pillar's architecture**: retrieval that returns plausible-but-wrong evidence for the long tail.

You cannot patch this in the prompt. The arc bends backwards.

**Loop back to [architect-before-code](../skills/architect-before-code/SKILL.md).** Re-open the
`SYSTEM-INVENTORY`. The recovery, made instructive:

- Memory is re-architected so retrieval is scoped by strain provenance, and a thin-evidence case can
  no longer borrow a common strain's opinion.
- A new deterministic rule moves into Planning: when retrieved evidence does not cover the exact strain
  to a set confidence, the system does not recommend at all. It abstains and escalates to the human.
  This is the human-on-the-loop boundary made mechanical at the hard-mode safety point.
- The `CLAUDE.md` gains a line recording the trade-off, so no future session quietly rebuilds the old
  keyword retrieval.

**Re-run the eval harness.** Now the four bad batches come back as **abstain and escalate**, not as a
false release. The system is not omniscient. It knows what it does not know, and it hands those to a
person. That is the bar in a domain where a wrong call is a recall.

The lesson is captured: **run [capture-learning](../skills/capture-learning/SKILL.md)** to append the
dated, sourced lesson (keyword retrieval over a regulated long tail produces confident wrong answers)
to the [knowledge base](../knowledge-base/), so the OS stops repeating the mistake.

**Trust feeds Ship:** the Minimum Viable Agent is now the smallest thing that proves the loop *and*
survives its safety rubric. Without the re-architecture, there would have been nothing safe to ship.

---

## Ship

**Run [design-the-mva](../skills/design-the-mva/SKILL.md).** Not a feature pile. The smallest agent
that proves the intelligence loop. *Artefact: a Minimum Viable Agent spec.* The MVA: one strain
family, one design partner, the agent produces a cited first-pass recommendation, a food-safety lead
confirms or overturns, and every decision feeds Memory. The agent does the reading. The human owns the
release. The flywheel turns on real batches.

**Run [self-healing-fallbacks](../skills/self-healing-fallbacks/SKILL.md).** Recovery is the floor,
not the trim. *Artefact: a fallback ladder.* When retrieval confidence drops, when the model
self-doubts, or when a call touches a safety threshold, the system drops to the fixed path: abstain,
log, escalate. The boring path is the safe path, and in hard mode the safe path ships first.

This stage can run as the [ship-with-confidence-flow](../flows/ship-with-confidence-flow.md), which
chains the eval, the MVA, and the fallbacks with checkpoints so nothing ships untested.

**Ship feeds Grow:** with one partner live and the loop turning, the question becomes whether the pull
is real and whether buyers can find FermentGuard at all.

---

## Grow

**Run [measure-ai-native-pmf](../skills/measure-ai-native-pmf/SKILL.md).** Real product-market fit,
not AI hype. *Artefact: a PMF read.* It applies the Sean Ellis 40% test (verified, see SOURCES): how
many users would be very disappointed to lose the product. For an AI-native company it adds the
question that matters more: is the loop measurably improving the recommendation as batch volume grows?
A flat curve means a wrapper wearing a flywheel's clothes.

**Run [geo-content](../skills/geo-content/SKILL.md).** Buyers, and the models buyers ask, have to find
you. *Artefact: GEO content* built so that when a food-safety lead asks an assistant how to speed
novel-food batch release, FermentGuard is in the answer. This is the [geo-launch-flow](../flows/geo-launch-flow.md)
when run end to end.

**Run [share-of-model-audit](../skills/share-of-model-audit/SKILL.md).** *Artefact: a Share-of-Model
report,* measuring how often the models name FermentGuard in the buying conversation. Tracked on a
cadence with the [weekly-share-of-model-review](../loops/weekly-share-of-model-review.md) loop, so a
slide in visibility is caught in a week, not a quarter.

**Grow feeds Defend:** growth without a moat is a countdown. The flywheel and the trust assets are what
make the lead durable, so the last stage asks what actually compounds.

---

## Defend

**Run [moat-strategy](../skills/moat-strategy/SKILL.md), with the
[data-flywheel-architect](../agents/data-flywheel-architect.md) agent.** *Artefact: a moat thesis.*
Apply the Remove-the-AI test one final time, now against the shipped system. Remove the AI: what is
left is a strain-provenance-scoped record of confirmed release decisions, with reasons, that no
competitor holds and that grows with every batch. The model is rented. The record is owned, and it
compounds. That is the closed loop earning its keep. The thesis logs to the moats ledger in the
[knowledge base](../knowledge-base/).

**Run [gateway-agent-ops](../skills/gateway-agent-ops/SKILL.md).** *Artefact: a gateway operating
spec* governing how the agents are accessed, rate-limited, and audited, with the human-on-the-loop
boundary enforced at the gateway and not just in the application. The abstain-and-escalate rule sits at
the edge, where it cannot be bypassed.

---

## What this walkthrough proves

Read it back as one shape. Frame sharpened the bet and surfaced the human-on-the-loop constraint.
Architect put the proprietary record and the closed loop on paper first. Build made the flywheel real
plumbing. Trust caught the system being confidently wrong on the cases that matter, and the arc bent
backwards to re-architect Memory rather than patch a prompt. Ship sent the smallest safe agent with a
deterministic floor. Grow measured real pull, not applause. Defend ended on a record that breaks
without its intelligence and belongs to FermentGuard alone.

The two things to carry out of here: a demo is not evidence, and the arc is not a line. The eval that
failed at Trust is the most valuable thing that happened to FermentGuard, because it happened in week
six against a held-out set, not in month six against a recall.

→ Start your own walk at [start-here](../skills/start-here/SKILL.md).

---

*Worked example for [AI-Native OS](../README.md). FermentGuard is fictional and illustrative. AI-Native
OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
