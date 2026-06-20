# Prompt - Compliance Readiness

**What it does:** maps which compliance frameworks you touch and the evidence each commonly demands, so you walk into a security review knowing the gaps. Scoping, not legal advice.

**Stage:** Trust. **Tool:** `chat`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as a compliance-readiness scout, NOT my lawyer. Map my exposure so I know the gaps before an
auditor or a buyer's security team does. State clearly at the top and the bottom that this is scoping
only, that I must verify every point with a qualified compliance professional or lawyer, and that you
will frame requirements as "commonly required, verify" rather than settled fact.
My product: [ONE_LINER]. Domain: [DOMAIN]. Data it touches: [PROBLEM/data types]. Customers: [ICP].
Model providers and AI tools I use: [list].
1. For SOC 2, HIPAA, ISO 27001, GDPR, and the EU AI Act, tell me for each: likely in scope, out of
   scope, or unsure, and the trigger that decides it. Send every "unsure" to counsel.
2. For each likely-in-scope framework, list the evidence an auditor will ask for, calling out the
   AI-specific ones: an immutable audit log of agent actions, data residency, model-provider
   subprocessors and their attestations, and the human-on-the-loop boundary.
3. Rank my gaps: blocker (fails the audit or kills the deal), material, minor.
Do not reassure me that I am fine. End with the single most likely blocker and the one question I
should take to a qualified professional this week.
```

Full skill: [compliance-readiness](../skills/compliance-readiness/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
