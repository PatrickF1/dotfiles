#!/usr/bin/env bash
alias ls="ls -Gh"
alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias history="history | tail -r | less"
alias ..="cd .."
alias vim="nvim"

alias clearf="pbpaste | pbcopy"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'