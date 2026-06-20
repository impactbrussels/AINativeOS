# AI-Native OS: Roadmap

What's shipped in v0.2, and what's next. Each unshipped item is a ready contribution slot: copy the
gold-standard [`architect-before-code`](skills/architect-before-code/) skill and open a PR
(see [CONTRIBUTING.md](CONTRIBUTING.md)). Difficulty tags: 🟢 good first issue · 🟡 help wanted ·
🔵 design needed.

## Shipped in v0.2 (the complete stack)

The whole method is now open and runnable. Every skill is a one-stop shop with its own `references/`
folder; every flow, loop, and agent links into the same vocabulary.

- **Handbook**: `00-introduction` plus all 14 chapters (15 in total, ~33,800 words) plus case studies plus `SOURCES.md`. ✅
- **Dictionary**: all 7 categories, 90 entries. ✅
- **Masterfiles**: `AI-NATIVE-MASTERFILE.md`, `SYSTEM-INVENTORY-TEMPLATE.md`. ✅
- **Skills (24)**, every one with a `references/` folder:
  - Cross-cutting: `start-here`, `capture-learning`, `apply-ai-native-models`, `design-a-loop`. ✅
  - Frame: `frame-the-hypothesis`, `map-the-terrain`, `customer-discovery-that-doesnt-lie`, `hypothesis-mining`. ✅
  - Architect: `architect-before-code`, `cognitive-architecture-review`. ✅
  - Build: `agentic-build-loop`, `pay-down-agentic-debt`, `write-the-claude-md`, `self-healing-fallbacks`. ✅
  - Trust: `eval-and-safety-harness`, `red-team-the-agent`, `compliance-readiness`. ✅
  - Ship: `design-the-mva`. ✅
  - Grow: `measure-ai-native-pmf`, `geo-content`, `share-of-model-audit`, `ai-assisted-sales`. ✅
  - Defend: `gateway-agent-ops`, `moat-strategy`. ✅
- **Flows (5)**: `idea-to-mva-flow`, `ship-with-confidence-flow`, `architecture-first-flow`, `geo-launch-flow`, `fundraise-the-ai-native-way-flow`. ✅
- **Loops (5) plus the loop-engineering subsystem**: `daily-agent-standup`, `ci-failure-triage`, `weekly-share-of-model-review`, `weekly-debt-and-eval-review`, `red-team-cadence`, with [`docs/LOOP-ENGINEERING.md`](docs/LOOP-ENGINEERING.md) and the [`design-a-loop`](skills/design-a-loop/SKILL.md) skill so you can build your own. ✅
- **Agents (6)**: `devils-advocate`, `safety-judge`, `clinical-reviewer`, `regulatory-proxy`, `data-flywheel-architect`, `customer-proxy`. ✅
- **Prompts**: the full library, 25 standalone copy-paste prompts (one per skill, plus the Remove-the-AI test and Share-of-Model), tool-tagged. ✅
- **Knowledge base**: `PRINCIPLES`, `DOS-AND-DONTS`, `PLAYBOOK-LESSONS`, `MOATS-LEDGER`. ✅
- **Install and docs**: [`install.sh`](install.sh) plus [INSTALL.md](INSTALL.md), the no-code guide [`docs/FOR-NON-TECHNICAL-FOUNDERS.md`](docs/FOR-NON-TECHNICAL-FOUNDERS.md), [`docs/STAGES.md`](docs/STAGES.md), the [cross-platform guide](docs/cross-platform-guide.md), and [CREDITS.md](CREDITS.md). ✅

## Next

The stack is complete; what remains is reach, polish, and depth. Each item is an open slot.

| Area | Item | What it does | Tag |
| ---- | ---- | ------------ | --- |
| Handbook | Print-ready PDF build | A LaTeX, A4 build of the 15-chapter Handbook for offline reading and print. | 🔵 |
| Examples | `examples/sample-ai-native-company.md` | One fictional company walking the whole arc, with a failed eval that forces a re-architecture. | 🟡 |
| Loops | More loops | A monthly moat review, a discovery-cadence loop, a fundraise-tracking loop. Design yours with `design-a-loop`. | 🟡 |
| Learning | Video and course | A short walkthrough series and a guided course built on the Handbook and skills. | 🔵 |
| Reach | i18n | Translations of the Handbook and Dictionary, starting with the core vocabulary. | 🟢 |

Have a skill, flow, loop, or agent the OS still needs? Open an issue or a PR. The contribution bar and
the scaffold are in [CONTRIBUTING.md](CONTRIBUTING.md).
