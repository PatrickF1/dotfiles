# add custom executables (e.g. git-shalector) to path
set --prepend PATH "$HOME/bin"

# Set PATH, MANPATH, etc., for Homebrew
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -q MANPATH; or set MANPATH ''
set -gx MANPATH /opt/homebrew/share/man $MANPATH
set -q INFOPATH; or set INFOPATH ''
set -gx INFOPATH /opt/homebrew/share/info $INFOPATH

# point ripgrep at its config file
set -x RIPGREP_CONFIG_PATH ~/.config/ripgrep

###################################
# Interactive mode configurations #
###################################
status is-interactive || exit

set -x EDITOR nvim
set -x LESSHISTFILE /dev/null
# This should be unnecessary, seems to be a macOS/man bug
# https://stackoverflow.com/questions/77526472/man-is-using-system-installtion-of-less-ignoring-path
set -x MANPAGER less

set -x fish_color_command B7D847
# suppress the default login message
set -g fish_greeting

fzf_configure_bindings --directory=\cf --git_status=\cs --processes=\cp
set fzf_diff_highlighter delta --paging=never --width=20

set -x FZF_DEFAULT_OPTS_FILE ~/.config/fzf

# n: start in type-to-nav mode
# A: disable automatically jumping into directories when in type-to-nav mode
# e: open text files in terminal
# i: show current file info
# u: use selection, don't prompt to choose between selection and hovered entry
# H: show hidden files
# U: show file's owner and group in status bar
# Q: disable confirmation on quit with multiple contexts active
set -x NNN_OPTS nAeiuHUQ
set -x NNN_FIFO /tmp/nnn.fifo # needed for preview-tui plugin to function
# - skips directory refresh, ! executes commands, * skips user confirmation
set -x NNN_PLUG (string join ';' c:fzcd z:autojump b:-clipboard r:gitroot 'v:-!code $nnn*' 's:-!|git status' 'd:-!git diff*' )
set -x NNN_BMS (string join ';' .:~/Code/dotfiles f:~/Code/fzf.fish d:~/Downloads k:~/Desktop x:~/Dropbox c:~/.config)

bind \cn _nnn_select_paths
bind \cb _cd_git_root
bind \e, 'prevd && commandline --function repaint'
bind \e. 'nextd && commandline --function repaint'

zoxide init fish | source

source ~/secrets.fish
