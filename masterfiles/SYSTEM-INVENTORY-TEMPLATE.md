# System Inventory: Template

> Fill this in **before** you generate a line of code. The System Inventory is the one document an
> AI-native founder writes first. It names every model, prompt, tool, and dependency so an agent
> building your system can see the *whole* thing, and stops hallucinating a parallel one.
>
> Copy this file, rename it `SYSTEM-INVENTORY.md`, and keep it in your repo root next to
> `CLAUDE.md` / `AGENTS.md`. Update it whenever the architecture changes. See Handbook
> [Chapter 05: Architecting Before You Touch Code](../handbook/05-architecting-before-code.md).

---

## 0. The one-line system

> In one sentence: what does this system do, and what breaks if you remove the AI? (If nothing
> breaks, stop; you're describing a wrapper, not an AI-native system. Re-read the Remove-the-AI test.)

`[ONE_LINER]`. Remove-the-AI: without `[the intelligence]`, the system `[what fails]`.

## 1. The Brain (reasoning)

The model(s) that reason. Keep this provider-agnostic where you can.

| Role | Model / tier | Why this one | Fallback model |
|------|--------------|--------------|----------------|
| Primary reasoning | `[e.g. a frontier model]` | `[latency / cost / capability]` | `[cheaper or alt-provider model]` |
| Cheap/bulk tasks | `[smaller model]` | `[volume, cost]` | `[deterministic path]` |

- Temperature / determinism policy: `[where you need reproducibility]`
- Where you require a **deterministic fallback** (no model): `[list the safety-critical paths]`

## 2. Memory (what it knows)

| Layer | What it stores | Tech | Refresh / TTL |
|-------|----------------|------|---------------|
| Persistent master context | Principles, trade-offs, constraints | `CLAUDE.md` / `AGENTS.md` | Updated each session |
| Retrieval (RAG) | `[domain docs, transcripts, dossiers]` | `[vector store]` | `[how it's re-indexed]` |
| Structured store | `[users, events, outcomes]` | `[db]` | n/a |
| The closed loop | `[what usage data feeds back to improve the system]` | n/a | n/a |

> **The closed loop is the most important row.** Name the data each interaction produces and how it
> makes the next interaction better. No loop → no [data flywheel](../dictionary/07-ai-native-business.md#data-flywheel) → no moat.

## 3. Planning (how it decides)

- Reasoning pattern: `[ReAct / chain-of-thought / plan-mode-first]`
- Where a human sets goals and reviews outcomes (**human-on-the-loop**): `[which decisions]`
- Where a human must approve each step (**human-in-the-loop**): `[irreversible / regulated actions]`
- Loop guardrails: max iterations `[N]`, token budget cap `[$ / tokens]`, timeout `[s]`

## 4. Tools (how it acts)

| Tool / API | What it does | Auth / secrets | Blast radius if it misfires |
|-----------|--------------|----------------|-----------------------------|
| `[API]` | `[read/write what]` | `[where the key lives]` | `[worst case]` |
| `[MCP server]` | `[capability]` | n/a | n/a |

## 5. Agents (who does what)

Avoid the **God Agent**. List specialised agents and the gateway that routes between them.

| Agent | Single job | Inputs | Outputs | Judged by |
|-------|-----------|--------|---------|-----------|
| Gateway | Classify and route requests | `[request]` | `[which specialist]` | n/a |
| `[specialist]` | `[one job]` | `[...]` | `[...]` | `[critic/judge rubric]` |

## 6. Evaluation & safety

- Eval set / golden dataset: `[where it lives, how big]`
- Critic/judge rubric (pass/fail checks the judge enforces): `[5 checks]`
- The six-pillar trust substrate status (for sensitive domains): versioned data `[ ]` · audit trail `[ ]` ·
  uncertainty surfaced `[ ]` · deterministic fallbacks `[ ]` · cybersecurity `[ ]` · forensic auditability `[ ]`
- Compliance scope (SOC 2 / HIPAA / ISO 27001 / etc.): `[which tools are in/out of audit scope]`

## 7. External dependencies & risks

| Dependency | Used for | Single point of failure? | Mitigation |
|-----------|----------|--------------------------|------------|
| `[cloud / API / vendor]` | `[...]` | `[Y/N]` | `[fallback / multi-region]` |

## 8. Open questions / logic-debt

> The honest list of what's hard-coded, deferred, or entangled: the debt you'll pay down by ROI.
> Mirror this into `CLAUDE.md` so the next agentic session inherits it.

- `[debt item]`, interest rate (what it blocks): `[scaling / data collection / safety]`

---

*System Inventory template. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
