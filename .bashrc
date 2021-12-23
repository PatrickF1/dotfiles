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

export NNN_OPTS='eudQ'
export NNN_PLUG='c:fzcd'

# name iTerm tabs after current directory (https://gist.github.com/phette23/5270658)
if [ $ITERM_SESSION_ID ]; then
  unset PROMPT_COMMAND
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

. $(brew --prefix asdf)/asdf.sh
. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
