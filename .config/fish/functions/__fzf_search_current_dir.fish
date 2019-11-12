function __fzf_search_current_dir --description "Search the current directory using fzf and fd. Insert the selected results into the commandline at the cursor."
    set files_selected (
        fd --hidden --follow --color=always --exclude=.git 2> /dev/null |
        fzf --multi --ansi | # multi allows selecting multiple results using TAB
        xargs
    )

    commandline --insert "$files_selected " # doesn't string escape so won't work with weird filesnames
    commandline --function repaint
end
