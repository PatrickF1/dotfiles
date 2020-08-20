# suppress the default login message
function fish_greeting
end

if test -e ~/.secrets.fish
    source ~/.secrets.fish
end

# add custom executables (right now, that is only git-shalector) to path
set --prepend PATH "$HOME/bin"

set -xg EDITOR "nvim"
# set some sensible default options to always pass into invocations of less
set -xg LESS "--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --window=-4"
# don't store any history of commands executed in less
set -xg LESSHISTFILE /dev/null
# point ripgrep at its config file
set -xg RIPGREP_CONFIG_PATH ~/.config/rg

# visual settings
set -g theme_nerd_fonts yes
set -g theme_color_scheme light
set -g fish_color_command B7D847
set -g theme_display_git_stashed_verbose yes

source (brew --prefix asdf)/asdf.fish
