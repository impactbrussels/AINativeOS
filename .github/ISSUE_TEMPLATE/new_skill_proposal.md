---
name: New skill proposal
about: Propose a new skill, flow, loop, or advisor agent for the OS
title: "[skill] "
labels: enhancement
---

## The founder job it does

One sentence on the job this does for the founder. One skill, one job. If you cannot name it in a sentence, it is probably two skills.

## The trigger

The "Use when..." line: the specific conditions, symptoms, and phrases a founder would actually say in the moment they need this. This is the most important line, since it is the only thing the agent sees when deciding to load the skill. State triggers only, never a workflow summary.

> Use when...

## The stage on the build arc

Where it sits: Frame, Architect, Build, Trust, Ship, Grow, Defend, or cross-cutting.

```
Frame  ->  Architect  ->  Build  ->  Trust  ->  Ship  ->  Grow  ->  Defend
```

## The artefact it produces

The real thing the founder walks away with (a document, a harness, a ledger entry, a scored decision). If it produces nothing concrete, it is not a skill.

## Notes

- Follow the bar in [`skills/templates/skill-scaffold.md`](../../skills/templates/skill-scaffold.md): scaffold-based body, a `references/` framework file, a `## Dictionary` cross-link, and a `## Copy-paste version`.
- Does it pass the Remove-the-AI test, and does it stay theme-agnostic (the founder supplies the domain)?
- Add a Dictionary entry for any new term, and a row in [ROADMAP.md](../../ROADMAP.md).
