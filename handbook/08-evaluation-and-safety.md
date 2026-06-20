# 08. Evaluation & Safety for Multi-Agent Systems

> **Thesis.** In hard mode a demo is not evidence. It is a liability with a clean interface. Trust here is engineered, not assumed, and you build it deliberately before you earn the right to act on a human being.

## The shift

Most software you have used fails cheaply. A bug means a bad afternoon, a refresh, a refund. The blast radius is your mood. So a generation of founders learned, correctly, that shipping fast and fixing in production beats polishing in private. That instinct built the modern web. It also kills people when you carry it into a clinic, a kitchen, or a ledger.

The systems in this chapter act on a body, money, or food. A bug here is a missed sepsis case, a mislabelled allergen, a dose suggested to a clinician who trusted the screen. The wrong answer does not stay on the screen. It walks out into a person.

This changes what the demo means. A demo is a sale of your best case. You picked the input, you picked the moment, you picked the patient whose data was clean. The model performed because you stacked the deck, not dishonestly, just naturally, the way anyone shows their work at its best. None of that proves the system is safe to act on. It proves the system can produce the right output on a curated case. The ward asks a different question entirely: can a tired human safely act on this output, on the worst case, at three in the morning, when the model is wrong and nobody is watching?

Those are not the same question. The distance between them is where people get hurt. In every other sector you can close that distance after launch. Here you close it before, because closing it after is a recall, a fine, or a funeral.

So the work flips. Generation is cheap. Evidence is the product. The model that drafts a clinical summary in two seconds has done the easy part. Proving the summary is true, complete, and safe enough for a clinician to sign their name under it is slow, adversarial, and the entire reason your company is allowed to exist. This is the Trust stage. Trust is not a vibe. It is a checklist, a pipeline, and a paper trail.

## The framework

Six things separate a system you can act on from a confident guess wearing a clean interface.

1. **The verification deficit is the real adversary.** The [verification deficit](../dictionary/05-failure-modes.md#verification-deficit) is the gap between a tech demo and the clinical or operational evidence needed to safely act on a person. It grows every time you let "it looked right" stand in for "it was proven right." The fix is not a better model, because a model is wrong sometimes by nature. The fix is to design verification into the product so the model produces checkable artefacts: citations that resolve to real papers, calculations you can re-run, claims chained to retrieved sources, confidence scores you can threshold. If checking is fast, checking happens. If checking is slow or impossible, the deficit wins.

2. **The six-pillar trust substrate is your gate, not your wishlist.** Before an AI system acts where being wrong hurts someone, six things must be true. Treat the [six-pillar trust substrate](../dictionary/06-evaluation-and-safety.md#the-six-pillar-trust-substrate) as a literal checklist you tick or you do not ship:
   - **Versioned data.** Every input the model saw is reproducible. When an alert fired, you can recover the exact data state that produced it, not today's data. Version inputs, model, prompts, and thresholds, so any past decision replays exactly.
   - **Immutable [audit trails](../dictionary/06-evaluation-and-safety.md#audit-trail).** Every decision, with its inputs, its confidence, its reasoning, written to a log that cannot be quietly edited later. Append-only, or it is theatre.
   - **[Uncertainty quantification](../dictionary/06-evaluation-and-safety.md#uncertainty-quantification).** The system knows, and surfaces, when it does not know. A flat confidence on a textbook case and a once-in-a-career anomaly is the dangerous default.
   - **[Deterministic fallbacks](../dictionary/06-evaluation-and-safety.md#deterministic-fallback).** A predictable non-AI path for low confidence or outright failure. The pillar most founders skip.
   - **Cybersecurity.** A clinical or financial system holds the most sensitive data a person owns. Encryption, access control, secrets management, threat modelling: floor, not later phase.
   - **Forensic auditability.** When something goes wrong, you can stand in front of an investigator and reconstruct exactly what happened, step by step, with timestamps and model versions. "We would have to guess" is not a defensible answer.

3. **Critic and judge pairing keeps the author from grading their own work.** An author cannot proofread their own typo, because they read what they meant to write. A model has the same blind spot, amplified: ask it to check its own output and the context that generated the answer is now defending it. So you split the roles. The [critic and judge pairing](../dictionary/04-agentic-patterns.md#critic-judge-pairing) is two agents, structurally separate. A generator drafts the report, the assessment, the dosing suggestion. A judge, running fresh with its own clean context and a written rubric, scores that draft against an explicit safety standard before anything reaches a human. Everything turns on the rubric. "Is this good?" passes everything. "Does every clinical claim cite a real, resolvable source, and is any number unsupported by the input?" catches the [hallucinated](../dictionary/05-failure-modes.md#hallucination) citation every run.

4. **Human-on-the-loop puts the human at the right altitude.** [Human-on-the-loop](../dictionary/04-agentic-patterns.md#human-on-the-loop-hotl) means humans set the goals and review the outcomes; agents execute the steps between, unattended. The clinician defines what a good summary is and reviews the daily exceptions queue, not every summary. Contrast human-in-the-loop, where a human approves each step before the next runs. These are opposite cost structures. Human-in-the-loop is right for the irreversible: administering a drug, executing a large trade, releasing a food product to market. Human-on-the-loop is right for everything else, and everything else is most of the work. Place the human too low and you have built an expensive autocomplete. Too high and a bad outcome reaches a person before anyone notices.

5. **Deterministic fallbacks are an ethical mandate in health, food, and finance.** A [deterministic fallback](../dictionary/06-evaluation-and-safety.md#deterministic-fallback) is a non-AI, predictable path the system takes when confidence drops below a threshold or the model fails. Not a better model. Not a retry. A different kind of answer: a fixed rule, a conservative default, an honest "I cannot assess this, escalating now." The alternative to a fallback is the model guessing under uncertainty, and a model with no fallback does not stop on a case it does not understand. It answers anyway, confidently, because that is what it was trained to do. A confident guess in a chatbot is annoying. A confident guess in a sepsis predictor is a clinical decision made by a system that admitted, in its own confidence score, that it did not know.

6. **The compliance-logging caveat will sink you quietly.** Some AI tools' activity is not captured in audit logs or compliance APIs. You wire a tool into your workflow, it reads and writes data, and depending on the tool, the plan tier, and the configuration, its actions may leave no trace in the logging surfaces your compliance programme depends on. For a marketing app, nobody cares. For a workload under SOC 2, HIPAA, or ISO 27001, the auditor asks for the access log, the tool is not in it, and you cannot demonstrate the controls your certification is built on. Before any AI tool touches regulated data, confirm in writing that it is in scope: that its activity flows into your audit trail and the vendor's coverage includes the surface you use. If you cannot confirm it, you block it. Not "we will check later." Later is after the audit fails.

## Why it holds

Three companies build verification into the structure of the company itself, not into a launch-day checklist.

**Glass Health** pairs its AI diagnostic outputs with dedicated Clinical Excellence teams that validate what the model produces. Read that as an org chart making a safety argument. They did not treat the model's output as the finished product. They treated it as a draft that a qualified human function must validate before it carries clinical weight. That is the critic and judge pattern and human-on-the-loop fused into a company structure: generation by model, validation by a separate expert function whose whole job is to catch what the model gets wrong. The lesson holds beyond medicine. In any consequential domain, validation is not a phase you finish. It is a standing team and a permanent cost of doing business safely.

**Aisthesis Medical** built a platform to predict sepsis roughly 48 hours before it presents [claimed in source]. Sit with what that demands. Sepsis is fast and lethal, so a true early warning is enormously valuable, and a false one, fired often enough, trains clinicians to ignore the system, which is worse than no system at all. The engineering problem is not "can we predict sepsis." It is "can we predict it with precision high enough that a busy clinician keeps trusting the alert." That is a verification-deficit problem wearing a modelling problem's clothes. The model's job is to be right. The product's job is to prove it is right often enough to stay credible at the bedside. A demo accuracy number means nothing until it survives the messy, false-positive-generating population the system will actually meet.

**EYVA** aims a smart-mirror system at predicting cardiovascular risk from non-invasive signals [claimed in source]. The promise is seductive: clinical-grade insight from hardware in your bathroom, no needle, no clinic. Which is exactly why the trust bar is brutal. The moment you claim to assess cardiovascular risk you have made a clinical claim, and a clinical claim from a consumer mirror clears the same validation bar as a clinical claim from a hospital device, or it is misleading at best. Non-invasive and convenient does not lower the evidence bar. Because the user is unsupervised and alone, it raises it.

One pillar, the deterministic fallback, has a resilience lesson the rest of the industry learned in public. In July 2024 a single faulty update propagated through a widely-used security component and grounded systems across industries at once. Healthcare was among the hardest hit: roughly 759 hospitals saw detectable disruption, with sector losses estimated near USD 1.9 billion [as reported]. The number is not the lesson. The shape is. Your beautiful, well-audited system runs on infrastructure you do not control, and that infrastructure has correlated failure modes. Your worst day may arrive not because you erred, but because a provider three layers below you did, and your fate is tied to thousands of strangers who use the same thing you do.

| Failure | A consumer app | A hard-mode system |
| --- | --- | --- |
| Hallucinated fact | a wrong answer someone might Google | a dose or allergen acted on by a human |
| Silent model failure | a blank screen, a refresh | an alert that never fired on a patient who crashed |
| Cloud outage | the app is down for an hour | the safety-critical path goes dark with no fallback |
| No audit trail | nobody asks | the certification you cannot demonstrate |

## In hard mode

This whole chapter is hard mode, so the hard-mode anchor is not a corner of it. It is the spine.

In a meme app a hallucination is a screenshot. On a label it is a recall. In a sepsis model it is a clinical decision nobody made on purpose. The same defect, the same model, three blast radii, and only the third one ends in a coroner's report. That is the asymmetry you are building against, and it rewrites the cost of every shortcut. Skipping uncertainty quantification saves a week and costs you the ability to know when to escalate. Skipping the audit trail saves a sprint and costs you the certification. Skipping the fallback saves almost nothing and costs you the one case that matters.

Red-teaming is how you find these before a user does. [Red-teaming](../dictionary/06-evaluation-and-safety.md#red-teaming) is the discipline of manufacturing the unhappy path on purpose, in a lab, where the only thing that gets hurt is a test case. You generate the inputs designed to make the model fail, the ambiguous prompts, the adversarial phrasings, the plausible-sounding study that does not exist, and you confirm that when the model does fail, your deterministic fallback actually fires. The deliverable is the list of cases where the model produced something unsafe and the fallback failed to catch it. Each one is a user who would have been harmed in production. You fix those before launch, then re-run, because red-teaming is not a one-time gate. Each new model version can fail in new ways the last one did not, a direct consequence of the entanglement you met in chapter 07.

And there is one hard-mode trap that never appears in any demo: the compliance-logging blind spot. Demos run on test data nobody is auditing, so the tool that leaves no trace in your audit trail looks identical to the tool that does. You discover the difference during certification, unless you gate it first. Make "is this tool in compliance scope?" a check every integration must pass, the same way you gate any access to protected data. When a vendor states a coverage figure, tag it [claimed in source] and verify it against their current attestation, because coverage changes and a model's knowledge of it is stale by definition.

## What it means for you

Pick one real feature, the one where being wrong has the highest cost, and do these five things to it.

1. **Write the judge's rubric as five binary checks.** Not "is it good." Specific, mechanically checkable, each one something a separate agent can hard-fail you on: every clinical claim cites a resolvable source; every number traces to an input; uncertain claims are flagged uncertain; confidence below threshold routes to the fallback. If you cannot write five sharp checks, your safety bar is still a vibe.

2. **Name your deterministic fallback in one sentence.** What the system does when confidence is low or the judge refuses. It must be non-AI, predictable, and safe by default. If your fallback is "retry the model" or "show the answer anyway," you do not have a fallback. You have a single point of failure in a costume.

3. **Walk the six pillars and find the one you are missing.** Most teams have the model and the interface and are missing versioned data, the immutable audit trail, or forensic auditability. The missing pillar is a blocker, not a nice-to-have. Pour it before you touch regulated data.

4. **Gate every AI tool on compliance scope before it touches regulated data.** Get the in-scope confirmation in writing. No confirmation, no access. This is a one-line policy that saves a failed certification.

5. **Raise the human only as high as the substrate allows.** Move from approving each step to reviewing the exceptions the system flags, and do it only once the critic and judge pairing, the uncertainty quantification, and the fallback are real. The substrate is what earns you the altitude. Without it, human-on-the-loop is just automation with nobody watching.

## The test

Take your highest-stakes AI feature and ask one question: when this model is confidently wrong on the worst case at three in the morning, what catches it before it reaches a person? If the honest answer is "nothing," you do not have a product. You have a liability with a clean interface, and you have a rubric and a fallback to write before you ship another line. → Run `eval-and-safety-harness`. Stage: Trust.

---

*Chapter 08 of [Load-Bearing](README.md). AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0. Prev: [07. Managing Agentic Technical Debt](07-agentic-technical-debt.md) · Next: [09. Designing AI-Native MVP Experiments](09-designing-the-mva.md).*
