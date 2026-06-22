#!/usr/bin/env bash
#
# install.sh - install AI-Native OS skills into your AI coding agent.
#
# AI-Native OS by Adam M. Adamek (Impact Brussels ASBL). Content CC-BY-4.0, code Apache-2.0.
#
# What it does:
#   Copies every skills/<name>/ directory (including its references/ subfolder) into the
#   skills folder your agent reads. Copy is the default, so the install keeps working even if
#   you later move or delete the clone. Pass --link to symlink instead (edit-in-place, for
#   contributors). Safe to re-run: nothing is overwritten unless you pass --force or confirm.
#
# Usage:
#   ./install.sh [--platform claude|codex|gemini] [--user | --project <path>] [--link] [--force] [--list] [--help]
#
# Options:
#   --platform <name>   Target agent. One of: claude (default), codex, gemini.
#                       Maps to the platform's skills directory (see below).
#   --user              Install for your whole machine (the default). Uses the platform's
#                       home directory:
#                         claude  -> ~/.claude/skills
#                         codex   -> ~/.agents/skills
#                         gemini  -> ~/.gemini/skills
#   --project <path>    Install into one project instead. Uses <path>/<platform-dir>, e.g.
#                         claude  -> <path>/.claude/skills
#                         codex   -> <path>/.agents/skills
#                         gemini  -> <path>/.gemini/skills
#   --link              Symlink each skill instead of copying it, so edits in the repo are
#                       picked up live. Best for contributors. The default is a safe copy.
#   --force             Overwrite skills that already exist, without asking.
#   --list              Show which skills would be installed, then exit (installs nothing).
#   --help              Show this help and exit.
#
# Notes:
#   - Cursor has no SKILL.md mechanism. It reads .cursor/rules/ai-native-os.mdc, which already
#     ships in the repo. There is nothing to install for Cursor; see INSTALL.md.
#   - Flows (flows/), loops (loops/), and advisor agents (agents/) are Markdown your agent reads
#     in place from the cloned repo. This script does not copy them; it prints where they live.
#   - Authoritative docs: Claude skills https://code.claude.com/docs/en/skills
#                         Gemini CLI     https://geminicli.com/docs/cli/

set -euo pipefail

# --- locate the repo (this script lives at the repo root) -------------------------------------
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"

# --- defaults ---------------------------------------------------------------------------------
PLATFORM="claude"
SCOPE="user"       # user | project
PROJECT_PATH=""
FORCE="no"
LIST_ONLY="no"
LINK="no"          # no = copy (default), yes = symlink

# --- help text --------------------------------------------------------------------------------
print_help() {
  # Print the leading comment block (lines 2-40: from after the shebang to the end of the header).
  sed -n '2,40p' "$0" | sed 's/^# \{0,1\}//'
}

# --- argument parsing -------------------------------------------------------------------------
while [ $# -gt 0 ]; do
  case "$1" in
    --platform)
      shift
      [ $# -gt 0 ] || { echo "Error: --platform needs a value (claude|codex|gemini)." >&2; exit 1; }
      PLATFORM="$1"
      ;;
    --platform=*)
      PLATFORM="${1#*=}"
      ;;
    --user)
      SCOPE="user"
      ;;
    --project)
      shift
      [ $# -gt 0 ] || { echo "Error: --project needs a path." >&2; exit 1; }
      SCOPE="project"
      PROJECT_PATH="$1"
      ;;
    --project=*)
      SCOPE="project"
      PROJECT_PATH="${1#*=}"
      ;;
    --link)
      LINK="yes"
      ;;
    --force)
      FORCE="yes"
      ;;
    --list)
      LIST_ONLY="yes"
      ;;
    --help|-h)
      print_help
      exit 0
      ;;
    *)
      echo "Error: unknown option '$1'. Run './install.sh --help'." >&2
      exit 1
      ;;
  esac
  shift
done

# Human-readable mode for the plan summary.
if [ "$LINK" = "yes" ]; then MODE="symlink"; else MODE="copy"; fi

# --- validate platform and map it to a skills subdirectory ------------------------------------
# Each platform reads SKILL.md from a different folder. These paths are the verified ones.
case "$PLATFORM" in
  claude) PLATFORM_DIR=".claude/skills"; HOME_DIR="$HOME/.claude/skills" ;;
  codex)  PLATFORM_DIR=".agents/skills"; HOME_DIR="$HOME/.agents/skills" ;;
  gemini) PLATFORM_DIR=".gemini/skills"; HOME_DIR="$HOME/.gemini/skills" ;;
  *)
    echo "Error: unknown platform '$PLATFORM'. Use claude, codex, or gemini." >&2
    exit 1
    ;;
esac

# --- resolve the destination ------------------------------------------------------------------
if [ "$SCOPE" = "project" ]; then
  if [ ! -d "$PROJECT_PATH" ]; then
    echo "Error: project path '$PROJECT_PATH' is not a directory." >&2
    exit 1
  fi
  # Normalise to an absolute path so the printed location is unambiguous.
  PROJECT_ABS="$(cd "$PROJECT_PATH" && pwd)"
  DEST="$PROJECT_ABS/$PLATFORM_DIR"
else
  DEST="$HOME_DIR"
fi

# --- sanity check the source ------------------------------------------------------------------
if [ ! -d "$SKILLS_SRC" ]; then
  echo "Error: cannot find skills/ next to this script (looked in $SKILLS_SRC)." >&2
  echo "Run install.sh from inside the cloned AI-Native OS repo." >&2
  exit 1
fi

# --- collect the list of skills (any skills/<name>/ that has a SKILL.md) -----------------------
SKILLS=""
for dir in "$SKILLS_SRC"/*/; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  # Skip the shared scaffold/templates folder; it is not an installable skill.
  [ "$name" = "templates" ] && continue
  [ -f "$dir/SKILL.md" ] || continue
  SKILLS="$SKILLS $name"
done

if [ -z "$SKILLS" ]; then
  echo "Error: no installable skills found under $SKILLS_SRC." >&2
  exit 1
fi

# --- --list short-circuit ---------------------------------------------------------------------
if [ "$LIST_ONLY" = "yes" ]; then
  echo "AI-Native OS skills found in $SKILLS_SRC:"
  for name in $SKILLS; do
    echo "  - $name"
  done
  echo ""
  echo "Target (platform=$PLATFORM, scope=$SCOPE, mode=$MODE): $DEST"
  exit 0
fi

# --- show the plan ----------------------------------------------------------------------------
echo "AI-Native OS installer"
echo "  Platform : $PLATFORM"
echo "  Scope    : $SCOPE"
echo "  Mode     : $MODE"
echo "  Source   : $SKILLS_SRC"
echo "  Target   : $DEST"
echo ""

# Create the destination if needed.
mkdir -p "$DEST"

# --- copy (or symlink) each skill, honouring --force and the overwrite prompt ------------------
INSTALLED=0
SKIPPED=0

for name in $SKILLS; do
  src="$SKILLS_SRC/$name"
  target="$DEST/$name"

  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ "$FORCE" = "yes" ]; then
      : # fall through to overwrite
    else
      # Ask before clobbering. If there is no interactive terminal, skip to stay safe.
      if [ -t 0 ]; then
        printf "  '%s' already exists. Overwrite? [y/N] " "$name"
        read -r answer || answer=""
        case "$answer" in
          y|Y|yes|YES) : ;;
          *)
            echo "    skipped $name"
            SKIPPED=$((SKIPPED + 1))
            continue
            ;;
        esac
      else
        echo "    skipped $name (already exists; re-run with --force to overwrite)"
        SKIPPED=$((SKIPPED + 1))
        continue
      fi
    fi
    # Remove the old copy/link so a stale references/ file cannot linger.
    rm -rf "$target"
  fi

  # Copy (default) or symlink (--link) the whole skill directory, including references/.
  if [ "$LINK" = "yes" ]; then
    ln -s "$src" "$target"
    echo "    linked $name -> $target"
  else
    cp -R "$src" "$target"
    echo "    installed $name -> $target"
  fi
  INSTALLED=$((INSTALLED + 1))
done

# --- summary ----------------------------------------------------------------------------------
echo ""
echo "Done. Installed $INSTALLED skill(s); skipped $SKIPPED."
echo ""

# --- next steps -------------------------------------------------------------------------------
echo "Next steps:"
case "$PLATFORM" in
  claude)
    echo "  1. Open Claude Code in any project."
    echo "  2. Ask: \"Use the start-here skill. I want to build an AI-native company.\""
    ;;
  codex)
    echo "  1. Open Codex in a project that has AGENTS.md (the repo ships one at its root)."
    echo "  2. Ask: \"Use the start-here skill. I want to build an AI-native company.\""
    ;;
  gemini)
    echo "  1. Open Gemini CLI. Keep GEMINI.md at the project root for full context."
    echo "  2. Ask it to activate the start-here skill, then describe your idea."
    ;;
esac
echo ""
echo "  Flows, loops, and advisor agents are read in place from the cloned repo:"
echo "    flows:  $SCRIPT_DIR/flows"
echo "    loops:  $SCRIPT_DIR/loops"
echo "    agents: $SCRIPT_DIR/agents"
echo ""
echo "  No terminal? You do not need this script at all. Open prompts/README.md and"
echo "  paste a prompt into Claude.ai, ChatGPT, or Gemini. See docs/FOR-NON-TECHNICAL-FOUNDERS.md."
