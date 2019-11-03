function __fzf_search_current_dir --description "Search the current directory for files and directories using fzf and fd. Insert the selected search results into the commandline at the cursor."
    fd --hidden --follow --exclude=.git 2> /dev/null |
    fzf --multi |
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