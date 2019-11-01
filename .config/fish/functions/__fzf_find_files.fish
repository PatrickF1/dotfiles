function __fzf_find_files --description "Select files under the current directory using fzf."
    rg --files --hidden --follow 2>/dev/null |
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