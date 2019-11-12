function __fzf_search_history --description "Search command history using fzf. Replace the current commandline with the selected command."
    history merge
    set command_selected (history --null | fzf --read0 --tiebreak=index --height 40% --query=(commandline))
    if not test -z $command_selected
        commandline --replace $command_selected
    end

    commandline --function repaint
end
