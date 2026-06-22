# Changelog

All notable changes to AI-Native OS are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project aims to follow
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned

- A print-ready PDF build of the Handbook (LaTeX, A4).
- More loops: a monthly moat review, a discovery-cadence loop, a fundraise-tracking loop.
- Translations of the Handbook and the non-coder prompts.
- A demo recording of a skill running end to end.

## [0.3.0] - 2026-06-22

Cohesion, distribution, and a new safety skill. AI-Native OS and FounderOS now read as one product family.

### Added

- **New skill `secure-the-connectors`** (Trust): hardens the MCP and tool-supply-chain layer with a connector-risk register, a least-privilege scope map, and a human gate on destructive tools. Brings the library to 25 skills.
- **One-command install** via `npx skills add impactbrussels/AINativeOS`, documented in the README and INSTALL.md alongside the installer and plugin paths.
- **Release automation**: `.github/release.yml` plus a tag-triggered release workflow that cuts a GitHub release with categorised, auto-generated notes.
- **British-spelling CI check** (`scripts/check-spelling.py`) wired into the linter, plus a manifest version-coherence check.
- **A sibling cross-link** to FounderOS in the README, positioning the two as one product family.

### Changed

- **Flows now register as slash commands**: `plugin.json` points the commands loader at `flows/`.
- **Supply-chain hardening**: all GitHub Actions pinned to commit SHAs, with Dependabot keeping the pins current weekly.
- **Richer Codex and marketplace manifests** (interface block, brand colour, metadata), aligned with FounderOS.

## [0.2.0] - 2026-06-20

The complete stack: every stage of the build arc is now covered, and every skill is a one-stop shop.

### Added

- **9 new skills**, taking the library to **24**, each now carrying its own `references/` folder with
  the full framework, decision tables, worked examples, and anti-patterns: `customer-discovery-that-doesnt-lie`,
  `hypothesis-mining`, `cognitive-architecture-review`, `write-the-claude-md`, `pay-down-agentic-debt`,
  `self-healing-fallbacks`, `red-team-the-agent`, `compliance-readiness`, `geo-content`,
  `share-of-model-audit`, `ai-assisted-sales`, `gateway-agent-ops`, `moat-strategy`,
  `apply-ai-native-models`, and `design-a-loop`.
- **A loop-engineering subsystem**: the `design-a-loop` skill, `docs/LOOP-ENGINEERING.md`, 9 new
  Dictionary entries (the agentic loop, the maker-checker split, the state file, the Ralph Wiggum loop,
  comprehension debt, cost per accepted change, and more), and **5 runnable loops**
  (`daily-agent-standup`, `ci-failure-triage`, `weekly-share-of-model-review`,
  `weekly-debt-and-eval-review`, `red-team-cadence`).
- **3 new flows** (`architecture-first-flow`, `geo-launch-flow`, `fundraise-the-ai-native-way-flow`)
  and **4 new advisor agents** (`clinical-reviewer`, `regulatory-proxy`, `data-flywheel-architect`,
  `customer-proxy`).
- **A complete non-coder prompt library**: 25 standalone, tool-tagged copy-paste prompts.
- **Installation**: `install.sh` and `INSTALL.md` for Claude Code, Codex, Cursor, and Gemini CLI, plus
  `docs/FOR-NON-TECHNICAL-FOUNDERS.md`.
- **`CREDITS.md`** crediting the inspirations (Pocock, Anthropic, Osmani, Huntley, Cherny) and verified
  related open-source projects.
- A worked end-to-end example, `examples/sample-ai-native-company.md`, walking one fictional company
  through the whole arc, including a failed eval that forces a re-architecture.
- Repository hygiene: `SECURITY.md`, `CODE_OF_CONDUCT.md`, `CHANGELOG.md`, issue and pull-request
  templates, a funding pointer, and a house-style CI check.

### Changed

- The Dictionary grew to **90 entries** across 7 categories.
- The Handbook was rebuilt to its current form: 15 chapters, roughly 33,800 words, every company proof
  point web-verified, in a consistent thesis-first voice.

### Fixed

- The content licence (`LICENSE-CONTENT`) was corrected: it had carried "FounderOS" text and pointed at
  the wrong repository. It now contains the full official CC BY 4.0 legal code, so GitHub identifies the
  content licence as CC-BY-4.0 rather than "Unknown".
- The GitHub organisation slug was standardised to `impactbrussels/AINativeOS` (lowercase, no hyphen).
- A repo-wide pass removed every em-dash and American spelling, and made all internal links and anchors
  resolve.

## [0.1.0]

The initial vertical slice.

### Added

- The Handbook (`00-introduction` plus the 14 chapters) and the case studies.
- The first Dictionary (7 categories).
- The masterfiles (`AI-NATIVE-MASTERFILE.md`, `SYSTEM-INVENTORY-TEMPLATE.md`).
- 9 skills (`start-here`, `frame-the-hypothesis`, `map-the-terrain`, `architect-before-code`,
  `agentic-build-loop`, `eval-and-safety-harness`, `design-the-mva`, `measure-ai-native-pmf`,
  `capture-learning`).
- 2 flows, 2 advisor agents, a starter prompt set, and the knowledge base.

[Unreleased]: https://github.com/impactbrussels/AINativeOS/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/impactbrussels/AINativeOS/releases/tag/v0.2.0
[0.1.0]: https://github.com/impactbrussels/AINativeOS/releases/tag/v0.1.0
