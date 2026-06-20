# AI-Native OS: Skill Scaffold

Every AI-Native OS skill is this shape filled in for one founder job. It exists so the whole OS
feels like one tool, and so a contributor's skill is indistinguishable from a core one. Authored to
the bar in the `writing-great-skills` reference: the `description` states **triggers only**, the body
is **predictable** (same process every run), and heavy reference is **disclosed** to `references/`.

## Frontmatter (required)

```yaml
---
name: hyphen-only-name
description: Use when [specific triggering conditions, symptoms, situations, phrases the founder uses]. [One sentence on what it produces.] Invoke before/after/with [related skill].
stage: frame | architect | build | trust | ship | grow | defend | cross-cutting
function: product | system | engineering | safety | growth | ops
license: CC-BY-4.0
attribution: AI-Native OS by Adam M. Adamek (Impact Brussels ASBL)
---
```

**The description is the most important line you will write.** It is the only thing the agent sees
when deciding whether to load the skill. State *when to reach for this*, never summarise the
workflow (if you do, the agent reads the description and skips the body). Pack it with the words a
founder would actually say and the symptoms of the moment it's needed.

## Body (the fixed shape)

```markdown
# Skill Title

[2–4 sentence opening: the stakes. Why this job matters, what goes wrong without it, and the
one-line reframe this skill installs. Pocock-style, a problem-first hook, no throat-clearing.]

## The method

[One line on tier/source + a pointer to references/<file>.md for the full framework.]

### Step 1: [imperative verb phrase]
[The move. A decision table or short list where the choice is non-obvious.]

### Step 2: [imperative verb phrase]
...

## Output

- [Each concrete artefact the founder walks away with.]
- [End by naming the next skill to run.]

## Constraints

- [Name the specific failure mode this job falls into, and forbid it.]
- [The Remove-the-AI / architecture-first / adversarial check relevant here.]
- Stay theme-agnostic; the founder supplies the domain, you supply the rigor.

## Dictionary

Links the key terms this skill uses into the vocabulary: [`term`](../../dictionary/0X-file.md#term).

## Copy-paste version

> For non-coders: paste into any chatbot or no-code builder (Claude.ai, ChatGPT, Lovable, Bolt, v0).

```
[A complete, self-contained prompt. Role + context + numbered steps + CONSTRAINTS naming the
failure mode + OUTPUT format ending in one next action. Every [PLACEHOLDER] from the glossary.]
```
```

## Placeholder glossary (shared across all skills)

| Placeholder | Means |
|-------------|-------|
| `[DOMAIN]` | The sector the founder supplies (food, health, deeptech, fintech…). |
| `[ONE_LINER]` | The product in one sentence. |
| `[ICP]` | Ideal customer profile, be specific; "everyone" means no one. |
| `[PROBLEM]` | The painful job the customer fails to get done today. |
| `[RISKIEST_ASSUMPTION]` | The belief that is both most uncertain and most fatal if wrong. |
| `[INTELLIGENCE_LOOP]` | The closed loop where use → data → a smarter product. |
| `[AGENT_TASK]` | The discrete job an agent owns. |
| `[GUARDRAIL]` | The deterministic fallback / human-on-the-loop check. |
| `[METRIC]` | The one number that proves the bet (often Share of Model or the 40% score). |
| `[CONSTRAINT]` | The binding limit: budget, timebox, regulation, headcount. |

## Authoring checklist (for new skills)

- [ ] `name` is hyphen-only; `description` starts with "Use when…", states triggers only, < 1024 chars.
- [ ] Frontmatter has `stage`, `function`, `license`, `attribution`.
- [ ] Body follows the fixed shape; placeholders use the shared glossary.
- [ ] `references/` holds the real framework (not restated prose).
- [ ] Has a `## Dictionary` cross-link and a `## Copy-paste version` block.
- [ ] Applies the relevant operating principle (Remove-the-AI, architecture-first, adversarial, HOTL).
- [ ] Stays theme-agnostic; an entry added to `ROADMAP.md`.
