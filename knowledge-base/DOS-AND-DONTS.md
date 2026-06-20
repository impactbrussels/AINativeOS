# AI-Native OS: Dos and Don'ts

Concrete, hard-won tactics. Theme-agnostic. Grown by `capture-learning`: append, never overwrite.
Each entry is one move and the reason behind it.

## Do

- **Do write a `SYSTEM-INVENTORY` before generating code**: every model, prompt layer, tool, and
  external dependency, named. The agent that can see the whole system stops hallucinating a parallel one. *(seed)*
- **Do keep a `CLAUDE.md` / `AGENTS.md` in your repo and update it daily** with architectural
  trade-offs and the logic-debt you're deferring. Persistent memory is how the next session stays grounded. *(seed)*
- **Do use plan mode / generate the module framework first**, then let agents fill in functionality.
  Structure first, logic second, or the codebase collapses. *(seed)*
- **Do pair a generator with a separate judge** in sensitive domains: one agent drafts, a second
  enforces a safety/compliance rubric before anything reaches a user. *(seed)*
- **Do pick a Goldilocks task for your first agent**: high-volume, guideline-based, low-risk. Earn
  trust before you point an agent at the dangerous work. *(seed)*
- **Do measure Share of Model**: run 20–50 buyer queries across ChatGPT, Claude, and Perplexity and
  track how often you're cited versus competitors. That's the new top of funnel. *(seed)*
- **Do feed raw interview transcripts to a model and ask it to argue the *opposite***: "give me five
  reasons these users won't pay." Extraction over flattery. *(seed)*

## Don't

- **Don't ship a "God Agent."** One agent trying to do everything is brittle and unauditable. Chain
  specialised agents with a gateway/router instead. *(seed)*
- **Don't let an agent loop without a budget cap and an iteration limit.** Unbounded agents burn
  tokens on unsolvable problems. Guardrail the loop. *(seed)*
- **Don't confuse a pilot with a contract, or a waitlist with revenue.** Behaviour and money are the
  only real demand signals; everything else is theatre. *(seed)*
- **Don't run regulated workloads through tools whose activity isn't captured in audit logs.** If you
  need SOC 2 / HIPAA / ISO 27001, confirm the tool is in scope before you touch real data. *(seed)*
- **Don't accept a number a model gives you without a source.** Hallucinated market sizes and prices
  feel authoritative and are often wrong. Trace it or label it. *(seed)*
- **Don't let one founder be the single point of failure** for a system that can hallucinate to
  customers. Build the review layer before the volume arrives. *(seed)*
