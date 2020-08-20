#!/usr/bin/env fish
function jump_to_git_root --description "Jump to the top-level directory of the current git repository."
    cd (git rev-parse --show-toplevel)
end