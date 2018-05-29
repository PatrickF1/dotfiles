fish_vi_key_bindings
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
status --is-interactive; and source (rbenv init -|psub)

if test -e ~/.fish_secrets
    source ~/.fish_secrets
end

# aliases
alias clearf="pbpaste | pbcopy"

set -xg EDITOR "/usr/local/bin/subl"
set -xg theme_nerd_fonts yes
set -xg theme_color_scheme base16