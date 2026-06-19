#!/usr/bin/env bash
#
# One-command bootstrap for a fresh macOS machine.
#
# This is the only step that cannot be written in fish, since fish itself is
# installed by Homebrew further down. Everything after the Homebrew bundle is
# delegated to the fish scripts in this directory.
#
# Safe to re-run: every step is guarded and idempotent.
#
# Usage (fresh machine, repo not yet cloned):
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/patrickf1/dotfiles/main/.dotfiles_meta/bootstrap.sh)"
#
# Usage (repo already cloned):
#   bash ~/Code/dotfiles/.dotfiles_meta/bootstrap.sh

set -euo pipefail

REPO_URL="https://github.com/patrickf1/dotfiles"
DOTFILES_DIR="$HOME/Code/dotfiles"

log() { printf '\n\033[1;34m==>\033[0m %s\n' "$1"; }

# ---------------------------------------------------------------------------
# 1. Xcode Command Line Tools (provides git, compilers Homebrew needs)
# ---------------------------------------------------------------------------
if ! xcode-select -p >/dev/null 2>&1; then
    log "Installing Xcode Command Line Tools"
    xcode-select --install
    echo "Waiting for the Command Line Tools install to finish..."
    until xcode-select -p >/dev/null 2>&1; do
        sleep 5
    done
fi

# ---------------------------------------------------------------------------
# 2. Homebrew
# ---------------------------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make brew available for the remainder of this script (Apple Silicon prefix).
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ---------------------------------------------------------------------------
# 3. Clone the dotfiles repo into its expected home
# ---------------------------------------------------------------------------
if [ ! -d "$DOTFILES_DIR/.git" ]; then
    log "Cloning dotfiles into $DOTFILES_DIR"
    mkdir -p "$DOTFILES_DIR"
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

# Wrapper that runs git against the home directory, mirroring the `dot` fish function.
dot() { git --git-dir="$DOTFILES_DIR/.git" --work-tree="$HOME" "$@"; }

# ---------------------------------------------------------------------------
# 4. Check the tracked files out into $HOME and quiet untracked-file noise
# ---------------------------------------------------------------------------
log "Checking out dotfiles into \$HOME"
dot reset --hard

dot config --local status.showUntrackedFiles no

# ---------------------------------------------------------------------------
# 5. Install everything in the Brewfile
# ---------------------------------------------------------------------------
log "Installing Homebrew bundle"
brew bundle install --file="$DOTFILES_DIR/.dotfiles_meta/Brewfile"

# ---------------------------------------------------------------------------
# 6. Hand off to the fish installers
# ---------------------------------------------------------------------------
log "Installing shell utilities"
fish "$DOTFILES_DIR/.dotfiles_meta/install_shell_utilities.fish"

log "Configuring macOS"
fish "$DOTFILES_DIR/.dotfiles_meta/configure_macos.fish"

log "Done! Open a new fish session to pick up all changes."
