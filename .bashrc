# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="$HOME/bin":$PATH

source ~/.config/bash/aliases.bash
source ~/.config/bash/functions.bash
source ~/.config/bash/git-completion.bash
test -e ~/.secrets.bash && source ~/.secrets.bash

export PS1="\[$(tput setaf 6)\][\u@\h \w]\\$ \[$(tput sgr0)\]"

export HISTSIZE='3000'
export HISTTIMEFORMAT='%F %T '
shopt -s histverify # don't immediately execute commands from history but copy them onto command line
shopt -s histappend # append to bash history instead of overwriting

export LESS="--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --window=-4"
export LESSHISTFILE='/dev/null'

export FZF_DEFAULT_OPTS="--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker='*'"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export NNN_OPTS=nAeiuHUQ
export _ZO_DATA_DIR=~/Library/ApplicationSupport/zoxide/bash
eval "$(zoxide init bash)"
