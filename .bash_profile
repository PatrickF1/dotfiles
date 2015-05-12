# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source .aliases

export PS1="\u@\h:\w\$ "
export HISTSIZE='2000'
