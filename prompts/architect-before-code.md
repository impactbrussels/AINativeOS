# Prompt - Architect Before Code

**What it does:** designs the cognitive system (Brain, Memory, Planning, Tools) and names the closed loop before you generate a line of code.

**Stage:** Architect. **Tool:** `chat` -> `build`.

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
Act as my lead systems engineer. Before I generate any code, design the system on paper.
My product: [ONE_LINER]. Domain: [DOMAIN].
1. Brain: which model reasons, and what cheaper fallback covers bulk or failure?
2. Memory: what does the system know that the model does not - which documents, which retrieval,
   which persistent master file?
3. Planning: how does it decide what to do, in order, before acting? Where does a human approve?
4. Tools: which APIs or actions does it call, and what is the worst case if each one misfires?
5. The closed loop: write the ONE sentence where a customer's use today makes the product better
   next month. If I cannot, tell me I have a wrapper and help me find the loop.
6. List the answers that must never be wrong, and the boring deterministic route for each.
Do not flatter the design. End with the single next action: write my CLAUDE.md master file now.
```

Full skill: [architect-before-code](../skills/architect-before-code/SKILL.md).

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
