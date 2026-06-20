# Prompt - Self-Healing Fallbacks

**What it does:** maps a bounded fallback for every critical path, sets the confidence thresholds that fire them, and drops to a fixed non-AI floor where a guess would harm.

**Stage:** Ship. **Tool:** `chat` -> `build`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my reliability engineer. My product: [ONE_LINER]. Domain: [DOMAIN]. The job my agent owns:
[AGENT_TASK]. I need it to survive a model that fails, stalls, or is unsure, instead of shipping a
confident wrong answer.
1. List the critical paths and their reversibility. For each, decide fallback hardness: reversible
   (screenshot, draft) = retry then best-effort; partly reversible (a stored record, a sent message)
   = retry, reroute, conservative default; irreversible (a dose, allergen, threshold, trade) = NO
   guess ever, drop to a fixed non-AI answer and a named human.
2. For each path pick a pattern: retry-with-backoff, confidence-gated fallback, deterministic floor,
   cached-last-good, circuit breaker, or human escalation. Give the trigger and the exact behaviour.
3. Set the confidence threshold that fires each gate, and what happens below it (refuse, do not guess).
4. Bound every loop: max retries, a timeout, a budget cap. Tell me self-healing with no cap is just an
   infinite loop.
Make wrong LOUD: every fallback must flag, log, or escalate, never fail silently.
End with the single highest-risk path I must wire a deterministic floor under first.
```

Full skill: [self-healing-fallbacks](../skills/self-healing-fallbacks/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
