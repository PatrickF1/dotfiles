function __fzf_search_history --description "Search command history using fzf. Replace the current commandline with the selected command."
    history merge
    history --null |
        fzf --read0 --tiebreak=index --height 40% --query=(commandline) |
        perl -pe 'chomp if eof' |
        read --local --null result
    and commandline --replace $result
    commandline --function repaint
end