function __fzf_search_current_dir --description "Search the current directory using fzf and fd. Insert the selected results into the commandline at the cursor."
    set files_selected (
        fd --hidden --follow --color=always --exclude=.git 2> /dev/null |
        fzf --multi --ansi | # multi allows selecting multiple results using TAB
        xargs
    )

    if test (count $files_selected) -gt 0 # need to use count because files_selected contains newline if fzf is canceled
        commandline --insert "$files_selected " # doesn't string escape so won't work with weird filesnames
    end

    commandline --function repaint
end
