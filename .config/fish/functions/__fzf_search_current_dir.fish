function __fzf_search_current_dir --description "Search the current directory for files and directories using fzf and fd."
    fd --hidden --follow --exclude=.git 2> /dev/null |
    fzf --multi |
    while read -l s
        set results $results $s
    end
    commandline -t ""
    for result in $results
        commandline -it -- (string escape $result)
        commandline -it -- " "
    end
    commandline --function repaint
end