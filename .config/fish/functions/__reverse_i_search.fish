function __reverse_i_search -d "Use fzf to reverse-i-serach"
    history merge
    history -z | fzf --read0 --tiebreak=index --height 40% -q '(commandline)' | perl -pe 'chomp if eof' | read -lz result
    and commandline -- $result
    commandline -f repaint
end