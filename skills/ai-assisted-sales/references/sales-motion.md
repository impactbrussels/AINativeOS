# AI-Assisted Sales: The Deep Framework

> Build agent-assisted pipelines for qualification, pilot design, and follow-up that escape pilot
> purgatory, treating AI as a revenue operating system rather than a chatbot bolt-on. This file
> holds the full framework behind the `ai-assisted-sales` skill: the pipeline stages with agent
> roles, the pilot-design template, the pilot-purgatory escape checklist, the trust ladder, a worked
> example end to end, the anti-patterns, and a copyable template. Source: handbook
> [Chapter 11](../../../handbook/11-ai-assisted-sales.md).

## The two shifts this framework answers

1. **Output is no longer chained to headcount.** Most of what loses deals is connective tissue:
   reading the inbound lead, deciding which is real, pulling the case study, drafting the reply,
   logging it, setting the reminder. None needs your expertise; all eats your hours. Hand it to a
   system that runs at three in the morning and the human shows up only for the part that needs a
   human. This is
   [decoupling headcount from revenue](../../../dictionary/07-ai-native-business.md#decoupling-headcount-from-revenue):
   doubling the pipeline adds load to a system that costs cents per task, not another coordinator.
2. **Motion gets confused with progress.** A demo books a pilot, a pilot earns a logo, a logo raises
   a round. Somewhere a signature got counted as revenue and nobody noticed the swap until the
   renewal never came. The framework gives you the machine and the discipline to read what it
   produces honestly, because a fast process that counts the wrong thing just reaches the wrong
   conclusion faster.

## AI as the revenue operating system, not a bolt-on

A bolt-on sits beside your revenue process, which stays exactly as manual as it was; you still need
one human per N leads. An operating system is the layer the work flows through: the lead lands in a
pipeline where an agent reads it, scores it, routes it, drafts the response, writes the CRM entry,
and the human enters only where judgement is required. A bolt-on saves minutes. An operating system
changes the shape of the company, because the connective work becomes the agent's job by default and
the human becomes the exception.

The architecture is the [gateway agent](../../../dictionary/04-agentic-patterns.md#gateway-agent)
pattern: a dumb router in front, narrow specialists behind. The routing spine your sales pipeline
needs is the identical spine your whole agentic org runs on, so build it once. See the
`gateway-agent-ops` skill for the spine itself.

## The pipeline stages with agent roles

Map the real sequence as it happens today, not the idealised version. The art is the cut: everything
below the trust line runs as software, everything above it stays a person. Get the line wrong and you
either drown your scarce people in clerical work or you let an agent make a promise it has no business
making.

| Stage | What happens | Agent role (middleware) | Human gate (above the trust line) |
| --- | --- | --- | --- |
| **Qualify** | An inbound lead lands. | Read it, score fit, route to the right path, draft the first-touch. | none, until the message goes out |
| **Scope** | Map the buyer's real need. | Gather context, pull the matching case study, draft the proposal, log to CRM. | the message that goes out under your name |
| **Pilot** | Run the agreed test. | Track usage signals, log outcomes, surface the success-metric reading. | the call on whether the bar was met |
| **Prove** | Show it worked. | Compose the pilot report, run the compliance and accuracy checks. | verify the output before it ships |
| **Expand** | Turn a pass into paid, then growth. | Draft the renewal, surface usage data, schedule the follow-up. | the close, and the money going out |

A second move belongs here: **proactive support**. Point an agent at your own signals, the logs and
transaction records and error streams, so it detects a failure that hit a customer and acts before a
ticket is filed. The customer's first contact about the problem is you, telling them it is already
handled. That is the single most trust-building message a vendor can send, and almost nobody sends it.

## The pilot-design template (set the bar before the pilot starts)

The core move of the whole skill. A pilot designed without a written success bar and a path to paid
is a pilot designed to stall. Fill this before the pilot begins, not after.

```
# Pilot Design: [buyer] x [your product]

## Success bar (set BEFORE start)
The one metric that converts to a yes: [exact number / threshold]
How it is measured: [who measures, with what, on what data]
The honest failure reading: [what number means "no", stated now]

## Timebox
Start date: [date]   End date (fixed): [date]
No "let's keep going": the pilot ends on the end date and a decision is made.

## Path to paid (written into the pilot agreement)
If the bar is met, the contract is: [terms, price, start date]
Who signs the paid contract: [named budget holder, not the champion]
What the pilot agreement says happens on a pass: [the pre-agreed trigger]

## Gate map (the corridor after the pilot)
| Function | Named owner | Where they stand today |
| --- | --- | --- |
| Champion (innovation) | [name] | sponsoring |
| Procurement (budget) | [name or BLANK] | [opened file? / not met] |
| Security review | [name or BLANK] | [questionnaire? SOC 2 line?] |
| Compliance / governance | [name or BLANK] | [asked about provenance + fallback?] |

## Provenance pack (clears the gates AND the regulator)
The same versioned data, audit trail, and deterministic fallback that satisfy the regulator are
what get you through security and compliance. See the six-pillar trust substrate.
```

## The pilot-purgatory escape checklist

A pilot signature is branded curiosity, not commercial traction. The innovation team that signed it
is the team whose job is to be curious about young companies; it does not control the budget.
Procurement controls the budget, and procurement has often never opened your file. The deal does not
get rejected. It gets a calendar invite, then a reschedule, then a quarter of silence, and the
founder reads the silence as "almost there" when it means "never started". Walk this checklist on
every live pilot.

- [ ] **Success metric written and agreed in advance.** If you cannot state the number that converts
      to a yes, the pilot cannot convert.
- [ ] **Fixed end date.** An open-ended pilot has no moment of decision, so the decision never comes.
- [ ] **Path to paid in the pilot agreement.** The pass-trigger is signed before the pilot, not
      negotiated after the excitement has cooled.
- [ ] **Budget holder named.** Name the person in procurement who has opened your file. If you
      cannot, you do not have a deal; you have a meeting that has not happened yet.
- [ ] **Security reviewer named, questionnaire seen.** The SOC 2 line you cannot tick is found now,
      not at the finish.
- [ ] **Compliance owner named, provenance question answered.** "The agent said so" ends the meeting;
      have the provenance and fallback ready.
- [ ] **Pilots and contracts in separate columns.** Never let the two share a row on a board deck.
- [ ] **Pilot-to-contract conversion tracked as its own number.** A stalled pilot is a signal, not
      the asset your champion wants it to be.

## The trust ladder

In hard-mode sectors trust is the currency, and it is earned in order. You cannot skip a rung. Each
rung has a move that earns the next.

| Rung | What the buyer has | The move that earns the next rung |
| --- | --- | --- |
| **Promise** | Your narrative and your demo. | Make a specific, falsifiable claim you can stand behind. |
| **Trust** | A reason to believe you, not just like you. | Show provenance: where the output comes from, what happens when it is wrong. |
| **Trial** | A pilot with a written success bar. | Hit the bar, verify the proof, hand them a report that survives an audit. |
| **Traction** | A paid contract that renewed. | Feed the use back into the product so the next buyer's pilot starts ahead. |

The ladder maps onto the [data flywheel](../../../dictionary/07-ai-native-business.md#data-flywheel):
traction is where the customer's use today makes the product better for the next buyer, which is the
moat the bolt-on competitor never builds. Promise into trust, trust into trial, trial into traction.
Proof before hype at every rung.

## Worked example: from drowning founder to gated pipeline

Illustrative domain, real method. A two-person regulatory-advisory firm sells compliance dossiers to
food-biotech startups. The founder is the only seller and is drowning.

### Before: the map

The founder writes the real path and marks each step.

| Step | Reality today | Mark |
| --- | --- | --- |
| Inbound enquiry arrives | Founder reads every one, most are unqualified | middleware |
| Decide if real | Founder checks the company against fit criteria | middleware |
| Pull the right case study | Founder hunts the folder | middleware |
| Draft the reply | Founder writes from scratch each time | middleware |
| The call | Founder runs it; this is the relationship | **human** |
| Log to CRM | Founder forgets half the time | middleware |
| Pilot | Ad hoc, no success metric, runs until it fizzles | broken |
| Renewal follow-up | Founder remembers when they remember | middleware |

Verdict: roughly 80% of the sales day is middleware wearing the costume of real work, and the one
human step, the call, is starved of time.

### The first agent (one step, not the pipeline)

The founder circles **qualify + draft first-touch**: most repetitive, most often where leads go cold,
lowest-risk (a clumsy draft is embarrassing, not catastrophic). An agent reads each inbound, scores
it against the fit criteria, pulls the matching case study, and drafts the first reply. The founder
approves the send. The human gate sits at the send and nowhere earlier.

### The pilot, redesigned

The next pilot is designed with the bar first:

- **Success metric**: the firm's dossier passes the buyer's internal pre-submission review with zero
  major data gaps flagged.
- **Timebox**: six weeks, fixed end date.
- **Path to paid**: on a pass, a 12-month advisory retainer at the agreed rate, signed by the
  buyer's head of regulatory (the budget holder), not the innovation lead who sponsored the pilot.
- **Gate map**: champion (innovation lead) sponsoring; budget holder (head of regulatory) named and
  booked for week 2; security and compliance not applicable at this firm's size, noted explicitly.

### The result the founder can read honestly

Pilots and contracts live in separate columns on the board. Pilot-to-contract conversion is its own
tracked number. When a pilot stalls, the founder reads the silence correctly, "the budget holder
never engaged", and acts, instead of leaving a dead logo on the fundraising slide. The middleware
runs unattended; the founder spends the recovered hours on the call and the close, the two steps only
they can do.

## Anti-patterns and their fixes

| Anti-pattern | Why it fails | Fix |
| --- | --- | --- |
| **Open-ended pilot** | No end date means no decision moment; the deal fizzles unseen. | Fixed end date and a written path to paid, set before the pilot. |
| **No success metric** | You cannot convert a pilot you never defined a pass for. | Write the one number that converts to a yes, agreed in advance. |
| **Automating spam** | Volume without judgement burns trust and the domain. | Automate the middleware, never the trust decision; quality over blast. |
| **Pilot logo as revenue** | A signature counted as money raises on a number you cannot defend. | Separate columns; track pilot-to-contract conversion on its own. |
| **Champion as budget holder** | The energy that signed the pilot does not transfer to the cheque-signer. | Name and book the budget holder on day one. |
| **Automating the whole pipeline first** | You learn nothing about where it fails until it fails on a real deal. | Automate one step, the lowest-risk high-cold step, first. |
| **Human gate in the wrong place** | An agent issuing a refund or a promise is a liability that bills you. | Human gate at the message out and the money out, nowhere else. |
| **Gates discovered at the finish** | Procurement, security, compliance kill the deal silently late. | Build the gate map before the pilot starts. |

## Copyable template: the sales-motion map

```
# Sales-Motion Map: [product]

## The path a dollar takes (today, not idealised)
| Stage | What happens | Agent role | Human gate | Mark |
| --- | --- | --- | --- | --- |
| Qualify | ... | ... | ... | middleware/human |
| Scope | ... | ... | ... | ... |
| Pilot | ... | ... | ... | ... |
| Prove | ... | ... | ... | ... |
| Expand | ... | ... | ... | ... |

% of sales day that is middleware: ___

## First revenue agent (one step)
Step automated first: [most repetitive + coldest + lowest-risk]
Human gate: at the send

## Pilot-to-paid gate
Pilots column: [list]    Contracts column: [list]   (never the same row)
Pilot-to-contract conversion: ___%

## Next
Stand up the routing spine via gateway-agent-ops. Capture the first pilot result via capture-learning.
```

---

*Reference for the `ai-assisted-sales` skill. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL).
CC-BY-4.0.*
