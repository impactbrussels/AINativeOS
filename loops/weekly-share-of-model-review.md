---
name: weekly-share-of-model-review
description: Use when a founder wants a weekly loop that tracks Share of Model - runs the locked buyer query set across the engines, computes citation share against named competitors, diffs the result against last week, flags the gaps, and drafts GEO content briefs to close them.
cadence: weekly
function: loop
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---

# Weekly Share-of-Model Review

A single Share-of-Model reading lies. The engines rephrase, a competitor ships a pillar page, a model
version changes its citation behaviour overnight, and your number moves for reasons no snapshot can
explain. What tells you anything is the series: the same locked query set, run weekly, diffed against
last week. This loop runs that series for you and turns the diff into a content backlog, so you find
out a rival is being cited in the rooms you cannot see while you can still respond.

Built on the loop-engineering framework: see [docs/LOOP-ENGINEERING.md](../docs/LOOP-ENGINEERING.md)
and [skills/design-a-loop/](../skills/design-a-loop/) for the underlying method.

## When to run

Weekly, on a fixed day, against a query set that does not change between runs. Monthly is the minimum
useful cadence for the audit itself; weekly catches a competitor's move before it compounds. Never
re-run on a changed set: a moving set measures nothing.

## The 4-condition check

1. **The task repeats.** Visibility in the answer box shifts every week. Tracking it is a standing job.
2. **Automated verification gates the work.** No brief ships until the diff is computed from the
   scored sheet, not from vibes, and the citation share survives a re-run on a clean session.
3. **It is budget aware.** A capped number of queries times engines per run, and a token ceiling. The
   panel is fixed, so the cost is predictable.
4. **The agent has senior tools.** It runs the real engines, scores each answer to the rubric, reads
   last week's state, and drafts to the same GEO standard a senior marketer would.

## Primitives

- **Automation / trigger:** a weekly scheduled run on a fixed day.
- **Skills it invokes:** [share-of-model-audit](../skills/share-of-model-audit/SKILL.md) to run the
  panel and score the sheet; [geo-content](../skills/geo-content/SKILL.md) to draft a brief for each
  flagged gap. Baselines come from [measure-ai-native-pmf](../skills/measure-ai-native-pmf/SKILL.md).
- **Connectors / MCP it touches:** the answer engines (ChatGPT, Claude, Perplexity) via a clean
  session each, read-only; the content repo (write briefs to a drafts folder, never publish).
- **Worktree isolation:** yes for the drafted briefs. Each GEO brief lands on its own branch so an
  unreviewed draft never enters the live content set.
- **Maker-checker split:** a maker sub-agent scores the panel and drafts the briefs; a separate
  checker sub-agent verifies the citation count against the raw answers (no over-claiming your share)
  and confirms each brief targets a real gap, not a query you already win.

## State

The agent forgets the last reading; the repo holds the series. This loop reads and writes
`loops/state/share-of-model-STATE.md`. Resume from it: the whole value is the week-on-week diff.

```markdown
# Share of Model State

## Locked query set
- version: v1 (frozen 2026-05-01) - 24 queries, 3 engines = 72 answers/run
- DO NOT edit without a version bump; a changed set breaks the series

## Last run
- date: 2026-06-19
- citation share: 38% (was 41% on 2026-06-12) - DOWN 3 pts
- first-mention share: 19% (was 18%) - flat
- top competitor by citation: [REAL_COMPETITOR_NAME] at 52%
- tokens used: 22,500 / 40,000 cap

## Week-on-week diff
- LOST citation on 3 comparison queries to [REAL_COMPETITOR_NAME]
- HELD all category queries
- new gap: "how do I [solve PROBLEM]" - cited neither us nor a rival (open ground)

## Drafted GEO briefs (awaiting human)
| query | gap type | brief | status |
|-------|----------|-------|--------|
| "[X] vs [Y]" | losing head-to-head | brief on branch geo/x-vs-y | DRAFTED |
| "how do I [solve PROBLEM]" | open ground | brief on branch geo/problem-led | DRAFTED |
```

## The gate

The objective check is twofold: the citation share must be recomputed from the scored answer sheet
(every cited / not-cited cell traceable to a real engine answer), and the diff must reconcile against
last week's STATE.md. A brief is marked `DRAFTED` only if it targets a query where you are genuinely
absent or losing, verified against the sheet. The checker can fail a brief that chases a query you
already lead. This is a real check, not a second agent saying the briefs look good.

## Hard stop

Stop when any fire:

- The query-and-engine panel is complete (the natural stop: fixed set, fixed engines).
- Token budget reached (suggested cap: 40,000 tokens per review).
- More than 3 briefs would be drafted in one run: stop at the top 3 gaps by buyer intent; a backlog
  of twelve briefs nobody writes is not progress.
- An engine is unreachable or rate-limited: record a partial run, flag the missing engine, do not
  fabricate the missing answers.

Write the partial state and the reason on any stop.

## Human-on-the-loop

The loop drafts; a human disposes. No GEO content is published by the loop. A human reviews and
approves every brief and every published page. Mandatory human sign-off before any of the following:

- Any public claim about a competitor (comparison content is a legal and reputational surface).
- Any number, percentage, or efficacy figure in published content (it must survive a web check).
- In hard mode, any health, food-safety, or regulatory statement in a brief, confirmed with a
  qualified professional before it ships.

The agent finds the gap and drafts the answer. You decide what goes out under your name.

## Cost per accepted change

Watch the **cost per accepted brief**: briefs a human approves and ships, divided by briefs drafted.
Below about 50%, the loop is drafting for queries you do not actually need to win, or the gaps it
flags are not real gaps. Stop and re-lock the query set or tighten the gate before adding more
queries. A loop that drafts ten briefs to publish one is burning your editorial attention.

## Example invocation

> Illustrative only. Exact syntax differs by platform. This is the shape, not a literal command.

```
/loop weekly
  /goal "Track Share of Model on the locked set, diff vs last week, draft briefs for real gaps."
  /steps
    1. Read loops/state/share-of-model-STATE.md; load the locked v1 query set; do not edit it.
    2. Run every query through ChatGPT, Claude, Perplexity in a clean session; score each answer.
    3. Compute citation share and first-mention share from the sheet, not from memory.
    4. Diff against last week's STATE: what was lost, held, gained; name the top competitor.
    5. Maker sub-agent drafts GEO briefs (geo-content) for the top 3 gaps by buyer intent.
    6. Checker sub-agent verifies the share math and that each brief targets a genuine gap.
    7. Write the new reading, the diff, and the briefs to STATE.md; publish nothing.
  /budget 40k tokens; stop at 3 briefs; flag any unreachable engine, never fabricate answers
  /human-disposes all publishing; human signs off every competitor claim and every figure
```

---

*Part of [AI-Native OS](../README.md) loops. AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). CC-BY-4.0.*
