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

# n: start in type-to-nav mode, where typing automatically filters directories
# A: disable automatically jumping into directories in type-to-nav mode
# e: open text files in terminal
# i: show current file info
# u: use selection, don't prompt to choose between selection and hovered entry
# H: show hidden files
# U: show file's owner and group in status bar
# Q: disable confirmation on quit with multiple contexts active
set -x NNN_OPTS nAeiuHUQ
set -x NNN_FIFO /tmp/nnn.fifo # needed for preview-tui plugin to function
# - skips directory refresh, ! executes commands, * skips user confirmation
set -x NNN_PLUG (string join ';' c:fzcd z:autojump p:-preview-tui r:gitroot 's:-!|git status' 'd:-!git diff*')
set -x NNN_BMS (string join ';' .:~/Code/dotfiles f:~/Code/fzf.fish d:~/Downloads k:~/Desktop x:~/Dropbox)
