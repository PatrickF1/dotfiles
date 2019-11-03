function __fzf_search_current_dir --description "Search the current directory using fzf and fd. Insert the selected results into the commandline at the cursor."
    fd --hidden --follow --color=always --exclude=.git 2> /dev/null |
    fzf --multi --ansi | # multi allows selecting multiple results using TAB
    while read --local s
        set results $results $s
    end
    commandline --current-token ""
    for result in $results
        commandline --insert --current-token -- (string escape $result)
        commandline --insert --current-token -- " "
    end
    commandline --function repaint
end