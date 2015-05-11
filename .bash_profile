# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source .aliases

export PS1="\u@\h:\W\$ "
export HISTSIZE='2000'