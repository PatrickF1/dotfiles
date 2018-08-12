if test -e ~/.iterm2_shell_integration.fish
    source ~/.iterm2_shell_integration.fish
end

if test -e ~/.fish_secrets
    source ~/.fish_secrets
end

# ensure the functions in this repo are available by prepending the functions directory
# path to fish_function_path
set fish_function_path $dotfile_fish_functions_path $fish_function_path

set -xg EDITOR "nvim"
# set some sensible default options to always pass into invocations of less
set -xg LESS "--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --window=-4"
# don't store any history of commands executed in less
set -xg LESSHISTFILE /dev/null

# visual settings
set -g theme_nerd_fonts yes
set -g theme_color_scheme light
set -g fish_color_command B7D847
__differentiate_tab_colors

# fzf plugin settings
set -g FZF_LEGACY_KEYBINDINGS 0
set -g FZF_FIND_FILE_COMMAND 'rg --files --hidden --follow --no-ignore-vcs -g !.git -g !node_modules -g !.idea 2> /dev/null'
set -g FZF_CD_COMMAND bfs -type d -nohidden | sed s/^\./~/
set -g FZF_CD_WITH_HIDDEN_COMMAND bfs -type d | sed s/^\./~/

