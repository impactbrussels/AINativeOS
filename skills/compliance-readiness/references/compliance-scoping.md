# Compliance Scoping: framework map, evidence checklists, and the gap ranking

This file maps which compliance frameworks an AI or agent workload commonly touches, what evidence each one tends to demand, and how to rank the gaps. It holds the framework-by-framework scope table, the agent-specific wrinkles, the evidence checklists, a worked scoping of a health AI product, the anti-patterns, and a copyable template.

## The disclaimer (read this first, it is load-bearing)

**This is scoping, not legal advice, and it does not replace a qualified compliance professional or a lawyer.** It maps what to check and what an auditor commonly asks for so you walk into a review knowing your gaps instead of discovering them. It does not tell you that you comply, and it cannot. Every framework below changes over time, applies differently by jurisdiction, product, and data type, and turns on facts only a professional who reviews your specifics can settle. Treat every requirement here as **"commonly required, verify current rules with counsel"**, never as settled fact. Where you are unsure of scope, the answer is not a guess in either direction; it is a question for a qualified professional. Use this to prepare for that conversation, not to skip it.

## 1. The framework-by-framework scope table

Five frameworks cover most AI workloads founders meet. Walk each one against your product. The triggers are the common cases, not a legal test; verify your specific situation.

| Framework | What it covers | Commonly applies when (verify with counsel) | The agent-specific wrinkle |
|---|---|---|---|
| **SOC 2** | A trust-services report on your security controls, produced by an auditor; the standard enterprise-buyer ask in the US | An enterprise customer requires it before they will trust you with their data; you sell B2B SaaS upmarket | Every agent action that touches customer data must land in an audit trail you can produce on demand; an AI tool whose activity is not logged is a control you cannot evidence |
| **HIPAA** | US rules protecting health information (PHI): privacy, security, and breach notification | You create, receive, store, or transmit US protected health information | A model provider or AI tool that processes PHI on your behalf may need a Business Associate Agreement (BAA); without one, sending PHI to it is commonly a violation, verify |
| **ISO 27001** | An international standard for an information-security management system (ISMS): a certified, audited security programme | A buyer or region expects a recognised certification, often outside the US | The ISMS scope must cover the AI tooling and model providers in your stack, not just your own application code |
| **GDPR** | EU regulation on processing the personal data of people in the EU | You process the personal data of people in the EU, regardless of where you are based | Data residency (where data is stored and processed), a lawful basis for processing, and disclosure of model providers as subprocessors; automated decisions with legal or similar effect carry extra obligations, verify |
| **EU AI Act** | EU regulation classifying AI systems by risk and imposing obligations per tier | Your AI system is placed on the EU market or affects people in the EU and falls into a regulated risk tier | Obligations scale with the risk classification of the use case; you must determine your tier and the duties it carries, which is a counsel question, not a guess |

These overlap. A health AI sold to EU hospitals can touch HIPAA-equivalent obligations, GDPR, the EU AI Act, and SOC 2 or ISO 27001 all at once. Scope is rarely one framework.

## 2. The agent-specific wrinkles (where AI workloads differ)

Standard compliance assumes a deterministic app. An agent that reasons, retrieves, and calls tools introduces surfaces a generic checklist misses. These are the ones to raise early.

| Wrinkle | The risk | What to confirm (verify with counsel) |
|---|---|---|
| **Audit logging of agent actions** | The agent reads and writes data, but its actions may not flow into the logging surface your compliance programme depends on | Before any AI tool touches regulated data, confirm in writing that its activity is captured in your audit trail. No confirmation, no access |
| **Data residency** | Model providers may process data in regions your obligations do not allow | Where does each provider process and store your data, and does that satisfy your residency obligations? |
| **Model-provider subprocessors** | Your model provider is a subprocessor handling your customers' data | List every provider, get their attestation (their SOC 2, ISO, DPA, BAA as relevant), and disclose them; their compliance is theirs, not yours |
| **Human-on-the-loop boundary** | Consequential automated decisions can carry extra regulatory duties | Document which decisions a human reviews versus which the agent makes alone, and check whether the decision type triggers added obligations |
| **Versioned, reproducible decisions** | When an auditor or investigator asks "why did the system do that on this date", you must reconstruct it | Version inputs, model, prompts, and thresholds so any past decision replays exactly |

The recurring trap: **treating a model provider's compliance as your own**. Their certification covers their service. It does not cover how you use it, what data you send, or whether your end-to-end system meets the bar. You still own your controls.

## 3. The evidence checklist per framework

An auditor wants artefacts, not assurances. For each in-scope framework, this is the common evidence to assemble. Verify the current, specific list with your auditor or counsel; this is a starting map.

### SOC 2 (common asks)
- A documented information-security policy set.
- Access controls: who can reach what, with least privilege and reviews.
- An immutable audit log covering agent and system actions on customer data.
- Change management: how code and config changes are reviewed and deployed.
- Vendor management: the list of subprocessors (including model providers) and their attestations.
- Incident-response and breach-notification procedures.
- Encryption in transit and at rest.

### HIPAA (common asks)
- A signed Business Associate Agreement with every vendor that handles PHI on your behalf, including AI tools and model providers, where applicable.
- A risk analysis covering where PHI flows, including through the agent and its tools.
- Access controls and audit logs specific to PHI access.
- Breach-notification procedures meeting the required timelines.
- Encryption and transmission safeguards for PHI.

### ISO 27001 (common asks)
- A defined ISMS scope that includes the AI tooling and model providers.
- A risk assessment and a Statement of Applicability mapping controls.
- Documented controls operating over a period, with evidence they ran.
- Internal audit and management-review records.

### GDPR (common asks)
- A record of processing activities, including AI processing.
- A lawful basis documented for each processing purpose.
- Data Processing Agreements with subprocessors, including model providers.
- Data-residency documentation and any transfer mechanism.
- Data-subject-rights procedures (access, erasure, objection).
- A Data Protection Impact Assessment where the processing is high risk, verify.

### EU AI Act (common asks)
- A determination of your system's risk classification, settled with counsel.
- The obligations that attach to that tier (documentation, transparency, human oversight, and more, depending on tier).
- Records demonstrating you meet the tier's duties.

Across all five, the AI-specific evidence repeats: the **audit log of agent actions**, the **subprocessor list with attestations**, the **data-residency proof**, and the **human-on-the-loop boundary**. Build those once and they serve every framework.

## 4. The gap ranking

A scope map and an evidence list produce a gap list: what you should have and do not. Rank it so you fix what stops a door first.

| Rank | Definition | Examples | Action |
|---|---|---|---|
| **Blocker** | Fails the audit on day one or kills the deal outright | No audit trail at all; PHI sent to a tool with no BAA; an AI tool confirmed out of logging scope | Fix before the review; do not send regulated data until closed |
| **Material** | An auditor will flag it; the deal slips while you remediate | Subprocessor list incomplete; data-residency undocumented; human-on-the-loop boundary not written down | Put on the readiness plan with an owner and a date |
| **Minor** | Tidy-up, not blocking | A policy document needs formatting; a control is informal but operating | Backlog |

Every gap gets a named owner. A gap with no owner is a gap that ships.

## 5. Worked example: scoping a health AI product

**The product.** A web app that reads a patient's uploaded lab results and drafts a plain-language explanation, sold to US clinics and piloting with one EU hospital. It uses a third-party model provider for generation and a vector store for retrieval.

### Step 1: framework-scope map

| Framework | Scope call | Trigger / reasoning | Route |
|---|---|---|---|
| HIPAA | In scope | It receives and processes US PHI | Counsel + BAA review |
| GDPR | In scope | The EU hospital pilot processes EU residents' personal data | Counsel + DPA review |
| EU AI Act | Unsure | Health-adjacent AI may fall in a regulated tier; the classification is not a guess | Counsel determines the tier |
| SOC 2 | Likely (verify) | US clinic buyers will probably require it for procurement | Confirm with buyers |
| ISO 27001 | Unsure | The EU hospital may expect it; the US clinics may accept SOC 2 instead | Confirm with each buyer |

Two firm "in scope", one "likely", two "unsure". Every unsure goes to a qualified professional. Nothing here is settled by the founder alone.

### Step 2: evidence checklist (the in-scope ones)

- **HIPAA:** signed BAA with the model provider and the vector-store vendor (verify each handles PHI and will sign); a risk analysis tracing PHI flow through the agent and both tools; PHI access logs.
- **GDPR:** a DPA with the model provider as subprocessor; data-residency confirmation for the EU pilot (where does the provider process the data?); a lawful basis documented; data-subject-rights procedures.
- **Cross-cutting AI evidence:** an immutable audit log of every agent action on patient data; the subprocessor list (model provider, vector store) with their attestations; the human-on-the-loop boundary (a clinician reviews every explanation before it reaches a patient).

### Step 3: ranked gaps

| Gap | Rank | Owner |
|---|---|---|
| No BAA with the model provider; PHI is being sent already | Blocker | Founder + counsel, this week |
| Model provider's data-residency for the EU pilot unknown | Blocker | Founder, confirm before pilot data flows |
| EU AI Act tier undetermined | Material | Counsel |
| Audit log exists for the app but not for the model-provider calls | Material | Engineering |
| SOC 2 readiness not started; a clinic buyer will ask | Material | Founder |
| Subprocessor list informal | Minor | Ops |

**The finding.** The product is not "compliant" or "non-compliant"; it has two blockers that must close before regulated data keeps flowing, two material gaps on the readiness plan, and a clear set of questions for counsel. The founder walks into the buyer's security review knowing exactly where the holes are, which is the entire point. The next step is to verify every scope call and requirement with a qualified compliance professional and a lawyer, then build the missing controls and run `red-team-the-agent` to prove they hold.

## 6. Anti-patterns and fixes

| Anti-pattern | Why it fails | Fix |
|---|---|---|
| **Assuming you are out of scope** | "We are too small / too early for that" is a guess, and the questionnaire does not care how early you are | Check the trigger for each framework; send every genuine "unsure" to a qualified professional, not to optimism |
| **Treating a model provider's compliance as your own** | Their SOC 2 covers their service, not your use of it or your end-to-end system; the auditor audits you | List providers as subprocessors, collect their attestations, and own your own controls on top |
| **Leaving logging until an incident** | The audit trail you need to evidence controls and reconstruct a decision must already exist when the auditor or investigator asks; you cannot back-fill it | Make the audit log a day-one control; confirm every AI tool is in logging scope before it touches regulated data |
| **Stating a requirement as settled fact** | Regulations change and vary by jurisdiction; a confident wrong statement of the rule is worse than "verify" | Frame every requirement as "commonly required, verify current rules with counsel" |
| **Scoping once and filing it** | Your stack, your buyers, and the regulations all change; last quarter's map is stale | Re-scope when you add a model provider, enter a new market, or take a new data type |
| **Skipping counsel because the map looks clear** | This is scoping; it prepares you for the professional conversation, it does not replace it | Use the map to brief a qualified compliance professional and a lawyer, and act on their verification, not on the map alone |

## 7. Copyable template: the compliance-scope map

```
# Compliance Scope Map: [product], [date]
# SCOPING ONLY. Not legal advice. Verify every line with a qualified compliance professional / lawyer.

## Product
One-liner: [ONE_LINER]
Data types touched: [PII / PHI / financial / none]
Customers and regions: [ICP, jurisdictions]
Model providers and AI tools: [list each]

## Framework scope
| Framework | In scope / Out / Unsure | Trigger / reasoning | Routed to counsel? |
|-----------|-------------------------|---------------------|--------------------|
| SOC 2     |                         |                     |                    |
| HIPAA     |                         |                     |                    |
| ISO 27001 |                         |                     |                    |
| GDPR      |                         |                     |                    |
| EU AI Act |                         |                     |                    |

## Evidence to assemble (per in-scope framework)
- Audit log of agent actions: [exists? in scope for every AI tool?]
- Subprocessor list + attestations: [model providers, stores]
- Data residency: [where is data processed/stored per provider]
- Human-on-the-loop boundary: [which decisions a human reviews]
- Framework-specific: [BAA / DPA / ISMS scope / risk analysis / tier determination]

## Gap list (ranked)
| Gap | Blocker / Material / Minor | Owner | Date |
|-----|----------------------------|-------|------|

## Rules
- Every "unsure" goes to a qualified professional, never to a guess.
- Requirements are "commonly required, verify", never settled fact.
- A provider's compliance is not yours; you own your controls.
- The audit log is a day-one control; no confirmation of logging scope, no regulated data.
- Re-scope on any new provider, market, or data type.
```
