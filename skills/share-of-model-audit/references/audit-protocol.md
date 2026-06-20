# Share-of-Model Audit: The Deep Protocol

> Measure how often the AI engines cite you versus competitors for the questions your buyers ask,
> then track it over time. This file holds the full protocol behind the `share-of-model-audit`
> skill: how to design the query set, which engines and surfaces to run, the scoring sheet, how to
> compute share and read the trend, the cadence, a worked example with a full scoreboard, and the
> anti-patterns. Source: handbook [Chapter 10](../../../handbook/10-narrative-positioning-geo.md)
> and [Chapter 12](../../../handbook/12-measuring-real-pmf.md).

## What Share of Model is, precisely

Share of voice measured how often your brand appeared across media. Share of Model measures how
often you appear *inside the AI answer* when a buyer asks a question in your category. It is earned,
not bought: it is a count of citation in AI-generated answers to buyer-intent queries, measured per
engine. It is the new top-of-funnel number because considered buying now starts in the answer box,
and it moves when the GEO work lands. The discipline is to watch the series, never the snapshot.

Two numbers come out of every audit:

- **Citation share** = answers that name you / total answers. Are you in the room at all?
- **First-mention share** = answers that name you first / total answers. The first name carries the
  default; this is the harder, more valuable number.

## Step 1: Design the buyer query set

The query set is the whole instrument. Tune it to flatter yourself and the audit measures nothing.
Three rules make it honest.

1. **Use the buyer's words, not yours.** Write the queries a buyer types mid-decision, not your
   product's marketing phrases. "best tool for [job]" beats "[your category coined term]".
2. **Cover the three intents.** A set that is all category queries misses the comparison losses
   where deals actually die.
3. **Lock the set.** Once chosen, freeze it. The point of the audit is month-on-month comparison,
   and you cannot compare a moving set.

| Intent | What to write | What it tells you | Count |
| --- | --- | --- | --- |
| **Category** | "best [category] for [ICP]", "top [job] tools" | Do you make the top-of-funnel shortlist? | ~40% of set |
| **Comparison** | "[competitor] alternatives", "[X] vs [Y]", "is [competitor] worth it" | Do you survive the head-to-head where the deal is decided? | ~35% of set |
| **Problem-led** | "how do I [solve PROBLEM]", "why does [PROBLEM] happen" | Do you own the job, not just the category label? | ~25% of set |

Aim for 20 to 50 queries. Below 20 the share number is too noisy to trend; above 50 the monthly
re-run gets abandoned. Thirty is a sound default.

## Step 2: Run a fixed engine panel

One engine is one opinion. Each engine cites differently, so run the identical set through a fixed
panel and keep the panel stable across months.

| Engine | Why it is in the panel | Surface notes |
| --- | --- | --- |
| **ChatGPT** | Largest buyer reach; the default first stop. | Run with web/browse on if your buyers research live topics. |
| **Claude** | Different training and citation behaviour; catches gaps ChatGPT hides. | Note when it cites without web access versus with. |
| **Perplexity** | Source-first; names its citations explicitly, so scoring is unambiguous. | The cleanest surface for counting who got named. |

Run-hygiene rules, because the answer is sensitive to setup:

- **Clean session per query.** Prior chat seeds the next answer; a fresh session per query stops you
  measuring your own conversation.
- **Log the date and engine version.** Models update; a shift in the number may be the model, not
  you. Date every run.
- **Hold the prompt constant.** Type the query as a buyer would, with no system preamble that nudges
  the answer toward you.

## Step 3: The scoring sheet

One row per query per engine. Score citation, not impression. A passing mention buried at the end is
still a citation; being named first is the stronger signal, scored separately.

| Field | Values | Rule |
| --- | --- | --- |
| Query | the locked text | verbatim |
| Engine | ChatGPT / Claude / Perplexity | one row each |
| Cited me? | yes / no | named anywhere in the answer |
| Named first? | yes / no | first company named in the answer body |
| Competitors cited | list of names | only real, named rivals |
| Winner | me / rival / neither | who the answer most endorses |
| Date | ISO date | for the trend |

## Step 4: Compute share and read the gaps

Per engine, and then pooled across the panel:

```
Citation share        = (rows where Cited me? = yes)  / (total rows)
First-mention share   = (rows where Named first? = yes) / (total rows)
```

Then build two derived views the raw sheet hides:

- **Per-engine split.** You may be cited in Perplexity and invisible in ChatGPT. That is a content
  format problem, not a global one, and it points the fix.
- **The gap list.** Rank the queries where you are absent (Cited me? = no) but should obviously lead.
  Sort by buyer intent: an absent comparison query bleeds revenue faster than an absent category
  query. This ranked list is the backlog you hand to `geo-content`.

## Step 5: Set the cadence and read the trend

A single reading lies. Re-run the locked set monthly, same panel, same hygiene.

| Reading | Honest interpretation |
| --- | --- |
| Rising citation share | Your content is becoming the category reference. The GEO work is compounding. |
| Flat | Confirmed flat, not "fine". Either you published nothing extractable, or a rival matched you. |
| Falling | A competitor is being cited in rooms you cannot see. Find which queries you lost and why. |
| One engine up, others flat | A format that one engine rewards. Port the winning structure to the others. |

The series is the asset. Quarterly, capture the move into the OS via `capture-learning` so the
reason a number moved is recorded, not re-guessed next quarter.

## Worked example: a sample scoreboard end to end

Illustrative domain, real method. A precision-fermentation regulatory-advisory firm runs a 6-query
slice of its 30-query set across the panel. Competitor names below are placeholders; in a real audit
you use the firm's actual named rivals.

### The scoring sheet (slice)

| Query | Engine | Cited me? | First? | Competitors cited | Winner |
| --- | --- | --- | --- | --- | --- |
| best EU novel-food consultant | ChatGPT | no | no | [Rival A], [Rival B] | rival |
| best EU novel-food consultant | Perplexity | yes | no | [Rival A] | rival |
| how long does EU novel-food approval take | ChatGPT | yes | yes | [Rival A] | me |
| how long does EU novel-food approval take | Perplexity | yes | yes | none | me |
| [Rival A] alternatives | ChatGPT | no | no | [Rival A], [Rival C] | rival |
| [Rival A] alternatives | Perplexity | no | no | [Rival A], [Rival C] | rival |

### The computed share (this slice, 6 rows)

```
Citation share      = 3 / 6 = 50%
First-mention share = 2 / 6 = 33%
```

### What the slice reveals

- The firm **owns the problem-led query** ("how long does approval take"): cited and first in both
  engines. That is where its extractable, sourced content already landed.
- It **loses every comparison query**: absent from both "[Rival A] alternatives" rows. [Rival A] is
  the competitor cited most, hypothesis: Rival A has published a comparison page the engines lift,
  and the firm has not.
- The **category query is split**: cited in Perplexity, absent in ChatGPT. A format problem, not a
  presence problem.

### The backlog handed to `geo-content`

1. Build the comparison piece for "[Rival A] alternatives" (highest-intent gap, comparison format).
2. Fix the category page so ChatGPT cites it, matching the structure Perplexity already rewards.
3. Hold the problem-led lead; it is the proof the method works.

The baseline is written down with the date. Next month the same six queries re-run, and the firm
reads the move, not the snapshot.

## Anti-patterns and their fixes

| Anti-pattern | Why it corrupts the audit | Fix |
| --- | --- | --- |
| **Cherry-picked queries** | A set tuned to flatter you measures your ego, not your buyer. | Use the buyer's words; include the comparison queries you fear. |
| **One engine only** | Each engine cites differently; one is one opinion. | Run the fixed three-engine panel every time. |
| **No baseline** | Without a dated first reading, you cannot tell a move from noise. | Write down the first number with its date; trend against it. |
| **Moving the query set** | A changed set makes months incomparable. | Lock the set; add new queries only as a separate, tracked tranche. |
| **Dirty sessions** | Prior chat seeds the answer toward you. | Clean session per query; constant prompt; no nudging preamble. |
| **Reading the snapshot** | A single month flatters or scares for the wrong reasons. | Watch the series; treat flat as confirmed flat. |
| **Vibes over count** | "We feel visible" is not a number. | Score citation per row: cited yes/no, first yes/no. |

## Copyable template: the Share-of-Model scoreboard

```
# Share-of-Model Audit: [month, year]
Locked query set version: [vN]   Engine panel: ChatGPT, Claude, Perplexity

## Scoring sheet
| Query | Engine | Cited me? | First? | Competitors cited | Winner | Date |
| --- | --- | --- | --- | --- | --- | --- |
| [q1] | [engine] | yes/no | yes/no | [names] | me/rival/neither | [date] |
| ... |

## Computed share
Citation share (this month):      __%   (baseline: __% on [date])
First-mention share (this month): __%   (baseline: __% on [date])
Per-engine citation share: ChatGPT __% | Claude __% | Perplexity __%

## Read
Top competitor by citations: [name], hypothesis: [one line]
Trend vs last month: rising / flat / falling, because [one line]

## Content backlog (to geo-content), ranked by buyer intent
1. [absent comparison query] -> [format]
2. [absent category query]   -> [format]
3. ...

## Next
Re-run identical set on [date next month]. Capture this month's move via capture-learning.
```

---

*Reference for the `share-of-model-audit` skill. AI-Native OS by Adam M. Adamek (Impact Brussels
ASBL). CC-BY-4.0.*
