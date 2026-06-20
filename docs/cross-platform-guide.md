# Cross-Platform Guide

AI-Native OS is **one content source, four harnesses**. The `skills/` files are written in *actions*
("read the file", "dispatch an agent", "search the web"), never one runtime's tool names, so the
same skill runs under Claude Code, Codex, Cursor, and Gemini CLI, and pastes into any chatbot.

## Instructions files by platform

| Platform | Reads | AI-Native OS file |
|----------|-------|-------------------|
| Claude Code | `CLAUDE.md` | `CLAUDE.md` (canonical master) |
| Codex | `AGENTS.md` | `AGENTS.md` (mirror) |
| Cursor | `.cursor/rules/*.mdc` | `.cursor/rules/ai-native-os.mdc` |
| Gemini CLI | `GEMINI.md` | `GEMINI.md` (mirror) |

All four discover skills under `skills/`. When you change the master instructions, keep `AGENTS.md`,
`GEMINI.md`, and the Cursor rule in sync with `CLAUDE.md`.

## Tool-name mapping (so skills stay neutral)

| Action a skill describes | Claude Code | Codex | Cursor | Gemini CLI |
|--------------------------|-------------|-------|--------|------------|
| Read a file | `Read` | `shell` (cat/sed) | view | `read_file` |
| Create / edit a file | `Write` / `Edit` | `apply_patch` | edit | `write_file` / `replace` |
| Run a shell command | `Bash` | `shell` | terminal | `run_shell_command` |
| Search file contents | `Grep` | `shell` (rg/grep) | search | `search_file_content` |
| Find files | `Glob` | `shell` (find/ls) | search | `glob` |
| Fetch a URL | `WebFetch` | `shell` (curl) | web | `web_fetch` |
| Search the web | `WebSearch` | `web_search` | web | `google_web_search` |
| Invoke a skill | `Skill` tool | loads natively | rule reference | `activate_skill` |
| Dispatch a subagent | `Agent` | `spawn_agent` / `wait_agent` | n/a | n/a |
| Track tasks | `TodoWrite` | `update_plan` | n/a | n/a |

## Packaging manifests

| Platform | Manifest |
|----------|----------|
| Claude Code | `.claude-plugin/plugin.json` + `.claude-plugin/marketplace.json` |
| Codex | `.codex-plugin/plugin.json` |
| Cursor | `.cursor/rules/ai-native-os.mdc` |
| Gemini CLI | `GEMINI.md` |

## Non-coder path (no agent CLI at all)

Every skill ends with a `## Copy-paste version`: a ready prompt for any chatbot (Claude.ai, ChatGPT,
Gemini) **or any no-code builder** (Lovable, Bolt, v0, Replit Agent). The `prompts/` folder indexes
them all, tagged by which tool each is best pasted into. A founder needs **zero tooling** to get
value: open the skill, copy the block, paste it, fill the `[PLACEHOLDERS]`.

## A note on models

AI-Native OS is model-agnostic. Skills assume a frontier model but never hard-code one: the same
method works whether you drive it with Claude (Opus/Sonnet), GPT (via Codex), or Gemini. Where a
capability genuinely differs (e.g. plan mode, MCP support, subagent dispatch), the skill says so and
gives the fallback.
