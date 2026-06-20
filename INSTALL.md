# Install AI-Native OS

AI-Native OS runs inside your AI coding agent (Claude Code, Codex, Cursor, Gemini CLI) and also
works with **no install at all** if you do not code. Pick the path that fits you.

## Fastest path

Clone the repo, run the installer, then ask your agent to use a skill:

```bash
git clone https://github.com/impactbrussels/AINativeOS.git
cd AINativeOS
./install.sh
```

Then, in Claude Code: *"Use the start-here skill. I want to build an AI-native company."*

Not a coder? Skip straight to [No install needed](#no-install-needed).

---

## What gets installed

A **skill** is one founder job (frame a hypothesis, architect before code, design an MVA). Each
lives in `skills/<name>/` with a `SKILL.md` and a `references/` folder. The installer copies those
directories into the folder your agent reads. **Flows** (`flows/`), **loops** (`loops/`), and
**advisor agents** (`agents/`) are Markdown your agent reads in place from the cloned repo, so they
need no separate install; keep the repo on disk and point your agent at it.

The skills folder differs by platform. These are the verified locations:

| Platform | User-level (whole machine) | Project-level |
|----------|----------------------------|---------------|
| Claude Code | `~/.claude/skills/<name>/SKILL.md` | `<project>/.claude/skills/<name>/SKILL.md` |
| Codex | `~/.agents/skills/<name>/SKILL.md` | `<project>/.agents/skills/<name>/SKILL.md` |
| Gemini CLI | `~/.gemini/skills/<name>/SKILL.md` | `<project>/.gemini/skills/<name>/SKILL.md` |
| Cursor | not applicable (uses rules, see below) | `.cursor/rules/ai-native-os.mdc` (ships in repo) |

The `SKILL.md` format is the open Agent Skills standard: the frontmatter needs only `name` and
`description`. The same skill source serves every platform.

---

## Claude Code

Three ways, from least to most manual. The plugin route is version-dependent; if it does not match
your build, use the installer or the manual copy below.

### Option A. Plugin / marketplace

The repo ships `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`, so you can add it
as a marketplace and install the plugin. In Claude Code's `settings.json`, add the repo to
`extraKnownMarketplaces`:

```json
{
  "extraKnownMarketplaces": [
    "https://github.com/impactbrussels/AINativeOS"
  ]
}
```

Then install the `ai-native-os` plugin from that marketplace inside Claude Code. The marketplace and
plugin mechanism evolves; if the field name or flow differs in your version, follow the official
guide: <https://code.claude.com/docs/en/skills>.

### Option B. install.sh (recommended)

From the cloned repo:

```bash
./install.sh                         # user-level: ~/.claude/skills
./install.sh --project /path/to/app  # one project: <path>/.claude/skills
./install.sh --force                 # overwrite existing skills without asking
./install.sh --list                  # preview what would be installed, install nothing
```

`--platform claude` is the default, so you can omit it. The script is safe to re-run: it never
overwrites without `--force` or a yes at the prompt, and it prints exactly what it copied and where.
Run `./install.sh --help` for the full option list.

### Option C. Manual copy

```bash
mkdir -p ~/.claude/skills
cp -R skills/*/ ~/.claude/skills/
```

For one project instead, use `<project>/.claude/skills/`. To remove the templates folder that is
not a real skill: `rm -rf ~/.claude/skills/templates`.

Custom slash commands, if you add any, go in `~/.claude/commands/<name>.md` (user) or
`.claude/commands/<name>.md` (project). Authoritative doc: <https://code.claude.com/docs/en/skills>.

---

## Codex

Codex reads `AGENTS.md` at the repo root for its master context; the repo already ships one, so open
Codex in a folder that has it (the cloned repo, or your project after you copy `AGENTS.md` across).

Skills use the same `SKILL.md` format and live in `~/.agents/skills/<name>/` (user) or
`<project>/.agents/skills/<name>/` (project). Install with the script:

```bash
./install.sh --platform codex                         # ~/.agents/skills
./install.sh --platform codex --project /path/to/app  # <path>/.agents/skills
```

Or copy by hand:

```bash
mkdir -p ~/.agents/skills
cp -R skills/*/ ~/.agents/skills/
```

---

## Cursor

Cursor has no native `SKILL.md` support. The mechanism is **project rules**: the repo ships
`.cursor/rules/ai-native-os.mdc`, which gives Cursor the AI-Native OS master context and points it
at `skills/` for the method.

To use it, keep the cloned repo open as your workspace, or copy the rule into your own project:

```bash
mkdir -p /path/to/app/.cursor/rules
cp .cursor/rules/ai-native-os.mdc /path/to/app/.cursor/rules/
```

Then reference a skill by name in chat (for example, *"follow the architect-before-code skill"*) and
keep `skills/` reachable in the workspace so Cursor can read the method and its `references/`.

---

## Gemini CLI

Gemini CLI reads a context file called `GEMINI.md`, at the project root or `~/.gemini/GEMINI.md`. The
repo ships `GEMINI.md`, so keep it at your project root for full context.

Skills use the same `SKILL.md` format and live in `~/.gemini/skills/<name>/` (user) or
`<project>/.gemini/skills/<name>/` (project), activated with `activate_skill`. Install with the
script:

```bash
./install.sh --platform gemini                         # ~/.gemini/skills
./install.sh --platform gemini --project /path/to/app  # <path>/.gemini/skills
```

Or copy by hand:

```bash
mkdir -p ~/.gemini/skills
cp -R skills/*/ ~/.gemini/skills/
```

Skill activation and context-file behaviour can change between releases. Authoritative doc:
<https://geminicli.com/docs/cli/>.

---

## No install needed

You do **not** need a terminal, a clone, or any agent CLI. Every skill ends with a copy-paste prompt,
and the most useful ones are standalone files you paste straight into a chatbot or a no-code
builder.

- Open the [Prompt Library](prompts/README.md), pick your stage, copy the block, paste it into
  Claude.ai, ChatGPT, or Gemini (or a builder like Lovable, Bolt, v0, or Replit), fill the
  `[PLACEHOLDERS]`, and iterate.
- Not sure where you are? Start with [start-here](skills/start-here/SKILL.md): it diagnoses your
  stage, runs the Remove-the-AI test, and routes you to one next skill.
- New to all of this? Read [docs/FOR-NON-TECHNICAL-FOUNDERS.md](docs/FOR-NON-TECHNICAL-FOUNDERS.md),
  a warm walkthrough written for founders who do not code.

---

## Verify it worked

Open your agent in the cloned repo (or a project where you installed the skills) and ask:

> Use the start-here skill.

If the agent loads `start-here` and begins diagnosing your stage with the Remove-the-AI test, you are
installed. If it cannot find the skill, check that the files landed in the right folder for your
platform (see the table above) and that you re-opened the agent after installing.

For how the same source maps across the four platforms, see
[docs/cross-platform-guide.md](docs/cross-platform-guide.md).

---

*AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). Content licensed CC-BY-4.0, code Apache-2.0.*
