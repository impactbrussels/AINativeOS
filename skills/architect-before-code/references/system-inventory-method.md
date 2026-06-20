# The System Inventory Method

Name every moving part before you generate one of them. This is the full method behind the skill:
the four pillars expanded, the closed loop that makes them a company, and a worked inventory you can
copy. The rule underneath all of it: an agent that can see the whole system stops inventing a
parallel one each session.

## The four pillars, expanded

| Pillar | The question it answers | What good looks like | What you name in the inventory |
|--------|-------------------------|----------------------|--------------------------------|
| **Brain** | What reasons, and at what price? | The right model per job, a cheaper fallback for bulk and for outages, an eval suite that catches regressions. | Primary model, fallback model, the rule that routes between them. |
| **Memory** | What does the system know that the Brain does not? | Retrieval over proprietary data, a vector store or index, a master file read at the start of every session. | Each data store, the retrieval path, the persistent master file. |
| **Planning** | How does it decide its moves, in order, before acting? | Explicit plan-then-act, a visible order of operations, a human gate before anything irreversible. | The plan step, the order, the approval point. |
| **Tools** | How does it reach the world? | Each call has a blast radius you can say out loud, irreversible actions gated, failures degrade to a safe path. | Each tool, its blast radius, its gate. |

## The closed loop comes first

Pillars can all pass and you still have a wrapper, because the moat is the loop. Before you score a
single pillar, write one sentence: "When a customer uses the product, ____ is captured, which makes
____ measurably better next month." Trace the return arrow from captured data back to a sharper
product. A missing link means the loop is open and nothing compounds. Design this line first;
everything downstream either feeds it or robs it.

## The naming walkthrough

Work the inventory in this order. Each step ends with a noun written down, never a vibe.

1. **State the one-liner and the domain.** One sentence on what the product does, one word on the sector.
2. **Name the closed loop.** The capture-to-improvement sentence. If you cannot write it, stop; you have a wrapper.
3. **Name the Brain.** Primary model, fallback model, the routing rule between them.
4. **Name the Memory.** Every store, the retrieval path, the master file the system reads first.
5. **Name the Planning.** The plan step, the order of operations, the human approval gate.
6. **Name the Tools.** Each external call, its blast radius, the gate on the irreversible ones.
7. **Name the fallbacks.** The answers that must never be wrong, and the deterministic route for each.
8. **Commit the master file.** Write `CLAUDE.md` / `AGENTS.md` before the first feature. Only now generate.

## Worked architecture: a regulatory-dossier assistant

A founder builds a tool that drafts sections of a regulatory submission from a company's internal
study library. Domain: a regulated sector. Here is the inventory, named before a line of code.

| Pillar | Named component | Blast radius / note |
|--------|-----------------|---------------------|
| Brain | Frontier model for drafting; a cheaper model classifies which section a query belongs to; route by task. | Wrong draft is caught downstream by the human gate, never auto-filed. |
| Memory | Vector store over the study library; a `CLAUDE.md` holding the house style, the claim rules, and the sections already approved. | Retrieval grounds every claim; the master file is read at session start so nothing is reinvented. |
| Planning | Plan step lists which sections to draft and in what order; a human approves the plan before drafting. | No section is filed without a named reviewer. |
| Tools | Read the study library; write a draft to a staging folder; export to the submission template. | The export-to-submission call is gated; staging writes are not. |

**Closed loop:** "When a reviewer corrects a drafted section, the correction is captured as a
labelled example, which makes next month's drafts need fewer corrections." The return arrow runs from
reviewer edits back into the retrieval set. That is the moat; the drafting alone is the wrapper.

**Fallbacks:** any claim touching a numeric threshold or a safety limit routes to a fixed,
non-AI lookup, not a model guess. Low confidence refuses and escalates to a named human.

## Anti-patterns and their fixes

| Anti-pattern | What it looks like | Fix |
|--------------|--------------------|-----|
| Prompt-as-architecture | The "architecture" is one long prompt. There is no system to audit, only wording to tweak. | Move structure out of the prompt into the inventory: pillars, stores, and gates as real components. |
| Bolt-on memory | Retrieval and the master file were added after launch as a patch, so they sit beside the system, not inside it. | Re-pour the floor. Make retrieval and the master file something the system reads first, every session. |
| No closed loop | Every pillar is solid, but no interaction leaves a signal behind. The product cannot compound. | Write the capture sentence first. Decide today what each interaction must leave behind. |
| Generating before naming | Code appears before the parts have names, so the agent invents a fresh shape each session. | Name all four pillars and the loop in the inventory, then release the agent against it. |

## Copyable template

```
SYSTEM INVENTORY: [PRODUCT]
One-liner: __________________________   Domain: [DOMAIN]

CLOSED LOOP (write this first):
  When a customer uses it, ____ is captured, making ____ better next month.
  Return arrow traced? yes / no

BRAIN
  Primary model: ______   Fallback: ______   Routing rule: ______

MEMORY
  Data stores: ______   Retrieval path: ______   Master file: CLAUDE.md / AGENTS.md

PLANNING
  Plan step: ______   Order of operations: ______   Human approval gate: ______

TOOLS (one row each)
  Tool: ______   Blast radius: ______   Gated? yes / no

FALLBACKS (answers that must never be wrong)
  Case: ______   Deterministic route: ______

NEXT ACTION: commit the CLAUDE.md master file, then generate against this inventory.
```
