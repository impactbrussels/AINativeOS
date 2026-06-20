# Prompt - Eval and Safety Harness

**What it does:** builds a binary safety rubric, a separate judge, a named deterministic fallback, and the human-on-the-loop line before the output can reach a user.

**Stage:** Trust. **Tool:** `chat` -> `build`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my AI safety engineer. My product: [ONE_LINER]. Domain: [DOMAIN]. The one feature where being
wrong costs the most: [FEATURE]. Help me make it safe before it touches a user.
1. Draft a safety rubric: five pass/fail checks a separate "judge" can hard-fail my output on (e.g.
   every claim cites a real source, every number traces to an input, low confidence refuses).
2. Name the deterministic fallback for [DOMAIN]: the non-AI, predictable path the system takes when
   confidence is low or the question touches a dose, allergen, or threshold. Not "retry the model".
3. Draw the human-on-the-loop line: what an agent can do unattended versus what a human must approve.
Don't reassure me. If a check is vague or the fallback is missing, say so. End with ONE next action I
should take today.
```

Full skill: [eval-and-safety-harness](../skills/eval-and-safety-harness/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
