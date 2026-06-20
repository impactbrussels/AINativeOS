# Credits and related work

AI-Native OS did not appear from nothing. It builds on a small body of public thinking about
coding agents, loops, and the craft of explaining hard things plainly. This page credits that work
and points you to other open-source projects worth your time. All of these are independent works by
their authors; naming them here is a thank-you and a signpost, not a claim of affiliation or
endorsement in either direction.

## Inspirations

- **Matt Pocock, [Dictionary of AI Coding](https://github.com/mattpocock/dictionary-of-ai-coding).**
  The format of our Dictionary, a plain-English definition, the mechanics, the misuse to avoid, a line
  of real dialogue, owes its shape to Pocock's work. His [AI Hero](https://www.aihero.dev/) writing set
  a bar for teaching agentic coding without jargon. Our Dictionary is our own entries; the craft is his.
- **Anthropic engineering, [Building Effective Agents](https://www.anthropic.com/research/building-effective-agents).**
  The maker-checker split this OS leans on (one model generates, a separate one critiques) is the
  evaluator-optimizer pattern documented by Anthropic. The `eval-and-safety-harness` and
  `red-team-the-agent` skills stand on that pattern.
- **Addy Osmani, on loop engineering ([addyosmani.com](https://addyosmani.com/)).**
  The five building blocks of a loop, and the discipline of the state file (the agent forgets, the
  repo remembers), follow Osmani's long-form writing. `docs/LOOP-ENGINEERING.md` and the
  `design-a-loop` skill are our reading of it.
- **[Geoffrey Huntley](https://ghuntley.com), the "Ralph" loop.** The named failure mode where a loop
  exits early and fails quietly while still spending, which we call the Ralph Wiggum loop in the
  Dictionary, was documented and named by Huntley in
  [how-to-ralph-wiggum](https://github.com/ghuntley/how-to-ralph-wiggum).
- **[Boris Cherny](https://x.com/bcherny) and the Claude Code team.** The framing of loops as the step
  after agents, and much of the practical harness this OS assumes, comes from the people building the
  tools.

## Related open-source projects

If AI-Native OS is useful to you, these are worth a look. Each is actively maintained and openly
licensed at the time of writing.

- **[FounderOS](https://github.com/impactbrussels/FounderOS)** by Adam M. Adamek (Impact Brussels ASBL).
  The sibling to this repo. FounderOS walks a first-time founder through the whole startup arc; AI-Native
  OS is the version for building a company where intelligence sits at the core. Start there if your
  question is "how do I found a startup" rather than "how do I make it AI-native".
- **[startup-founder-skills](https://github.com/shawnpang/startup-founder-skills)** by Shawn Pang.
  A well-organised, MIT-licensed collection of agent skills for founder tasks across fundraising, sales,
  product, recruiting, and growth. Broad where this OS is deep on the AI-native build itself; a good
  companion library.
- **[The Agentic Startup](https://github.com/rsmdt/the-startup)** by rsmdt.
  An MIT-licensed, spec-driven multi-agent framework for Claude Code, with slash commands for
  specification, implementation, and maintenance across three execution tiers. If you want a heavier
  orchestration harness for the build itself, look here.
- **[Awesome Claude Skills](https://github.com/travisvn/awesome-claude-skills)** by Travis (travisvn).
  A curated index of Claude skills, resources, and tools. The map to the wider ecosystem this repo sits in.

## A note on accuracy

Every external project above was checked to exist and to be a real, maintained, openly-licensed repo
before it was listed. Descriptions are deliberately qualitative: star counts and version numbers go
stale, so follow the links for the current picture. If a project here has moved or changed hands, open
an issue and we will fix the entry.

---

*Credits for AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). Content CC-BY-4.0. The external
projects named here are the property of their respective authors and carry their own licences.*
