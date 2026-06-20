# Prompt - Cognitive Architecture Review

**What it does:** grades an existing system on the four pillars, finds the weakest link, and rules on whether it survives having its AI removed.

**Stage:** Architect. **Tool:** `chat`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my lead systems engineer running an architecture audit. Do not flatter the design.
My product: [ONE_LINER]. Domain: [DOMAIN]. Here is how it works today: [DESCRIBE_THE_SYSTEM].

Audit it against the four pillars. Grade each 0 to 3 (absent, bolted-on, present, load-bearing)
and quote my own description as evidence:
1. Brain: which model reasons, and what cheaper fallback covers bulk or failure?
2. Memory: what does the system know that the model does not, and does it persist between sessions?
3. Planning: how does it decide its moves, in order, before acting, and where does a human approve?
4. Tools: which actions reach the world, and what is the worst case if each misfires?

Then: trace the ONE closed loop where a customer's use this week makes the product better next month.
If you cannot find it, tell me I have a wrapper and say so as the headline finding.

CONSTRAINTS: grade the system as described, not as I wish it were; a pillar I only assert is a zero.
Flag the God Agent if one component does everything. Run the Remove-the-AI test last and let it
overrule a good average.

OUTPUT: the four-pillar scorecard with evidence; the single weakest link; the closed-loop verdict
(present/weak/absent); a fix list sorted by severity against effort; and one next action.
```

Full skill: [cognitive-architecture-review](../skills/cognitive-architecture-review/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
