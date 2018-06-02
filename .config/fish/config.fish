fish_vi_key_bindings
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

if test -e ~/.fish_secrets
    source ~/.fish_secrets
end

# aliases
alias clearf="pbpaste | pbcopy"

set -xg VISUAL "vim"
set -xg EDITOR "vim"
set -g theme_nerd_fonts yes
set -g theme_color_scheme base16