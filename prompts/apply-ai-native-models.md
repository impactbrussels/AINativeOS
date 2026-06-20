# Prompt - Apply AI-Native Models

**What it does:** runs a hard decision through eight of the OS's mental models, in order, then makes the call and names the single most fatal assumption to test next.

**Stage:** Cross-cutting. **Tool:** `chat`.

> For non-coders: paste into any chatbot (Claude.ai, ChatGPT, Gemini).

```
Act as my decision partner, and do NOT just agree with me. I have a hard call to make.
Decision: [ONE_LINER as a claim that could be proven wrong]. Domain: [DOMAIN]. Customer: [ICP].
The riskiest thing I believe: [RISKIEST_ASSUMPTION].
Run my decision through these eight mental models, in order, and score each pass or fail with one
line of reasoning. Do not skip the ones that make my plan look worse:
1. Remove-the-AI test: if I delete the AI, does this still break? If not, it's a feature.
2. Architecture before code: is the system designed before any code gets generated?
3. Adversarial by default: make the STRONGEST case that this decision is wrong.
4. Human on the loop: is a person set above any irreversible step?
5. Store the proprietary, rent the replicable: am I building what compounds and renting the commodity?
6. A demo is not evidence: what did a REAL user (not a demo) actually prove?
7. Proof before hype: what claim here survives a web check or a real test?
8. Trust as the currency: does this earn or spend trust with my buyer?
Then: make the call, name the ONE model that most constrains it, and name the single assumption that
is most uncertain AND most fatal if wrong - that's what I test next.
Give it to me as a one-page memo. Don't flatter the plan.
```

Full skill: [apply-ai-native-models](../skills/apply-ai-native-models/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
