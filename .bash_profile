# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source .aliases

export PS1="\u@\h:\w\$ "
export HISTSIZE='2000'

shopt -s histverify # don't immediately execute commands from history but copy them onto command line
shopt -s histappend # append to bash history instead of overwriting