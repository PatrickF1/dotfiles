function __fzf_find_file -d "Find"
    rg --files --hidden --follow --no-ignore-vcs -g !.git -g !node_modules -g !.idea 2> /dev/null | fzf --multi
    eval "$FZF_FIND_FILE_COMMAND | "(__fzfcmd) "--multi $FZF_DEFAULT_OPTS $FZF_FIND_FILE_OPTS --query \"$fzf_query\"" | while read -l s; set results $results $s; end
    and commandline -- $result
    commandline -f repaint
end