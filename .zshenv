# Sourced by every zsh invocation (login, non-login, interactive, non-interactive).
# Keep this minimal — it runs for every script, subshell, and tool-spawned shell.
# This is the only zsh rc file sourced by non-interactive subshells (e.g. Claude
# Code's Bash tool, GUI apps), which is why ~/.env loading lives here.

# Load cross-shell env vars from ~/.env (KEY=value, gitignored).
# `set -a` auto-exports every assignment in the sourced file.
if [ -f "$HOME/.env" ]; then
    set -a
    . "$HOME/.env"
    set +a
fi
