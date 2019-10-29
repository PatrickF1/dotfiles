function __fzf_replace_command -d "Replace your commandline with a command found through fzf"
    history merge
    history -z | fzf --read0 --tiebreak=index --height 40% -q (commandline) | perl -pe 'chomp if eof' | read -lz result
    and commandline -- $result
    commandline -f repaint
end