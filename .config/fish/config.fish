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

source ~/secrets.fish

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

bind \cb _cd_git_root
bind \e, 'prevd && commandline --function repaint'
bind \e. 'nextd && commandline --function repaint'

zoxide init fish | source

