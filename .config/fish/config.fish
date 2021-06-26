# not currently using .secrets.fish
# if test -e ~/.secrets.fish
#     source ~/.secrets.fish
# end

# add custom executables (right now, that is only git-shalector) to path
set --prepend PATH "$HOME/bin"

set -x EDITOR nvim
# set some sensible default options to always pass into invocations of less
set -x LESS "--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --window=-4"
# don't store any history of commands executed in less
set -x LESSHISTFILE /dev/null
# point ripgrep at its config file
set -x RIPGREP_CONFIG_PATH ~/.config/rg

source (brew --prefix asdf)/asdf.fish

###################################
# Interactive mode configurations #
###################################
status is-interactive || exit

fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs

set -x fish_color_command B7D847

# suppress the default login message
set -g fish_greeting
