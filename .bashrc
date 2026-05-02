# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="$HOME/.local/bin":$PATH

# Load cross-shell env vars from ~/.env (KEY=value, gitignored).
# `set -a` auto-exports every assignment in the sourced file.
if [ -f "$HOME/.env" ]; then
    set -a
    . "$HOME/.env"
    set +a
fi

# Bash-specific machine-local config (gitignored): NVM init, derived URLs, etc.
[ -f "$HOME/secrets.bash" ] && . "$HOME/secrets.bash"

source ~/.config/bash/aliases.bash
source ~/.config/bash/functions.bash
source ~/.config/bash/git-completion.bash

export PS1="\[$(tput setaf 6)\][\u@\h \w]\\$ \[$(tput sgr0)\]"

export LESSHISTFILE='/dev/null'

export HISTSIZE='3000'
export HISTTIMEFORMAT='%F %T '
shopt -s histverify # don't immediately execute commands from history but copy them onto command line
shopt -s histappend # append to bash history instead of overwriting

export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf"

eval "$(zoxide init bash)"
