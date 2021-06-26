#!/usr/bin/env fish
function cd_git_root --description "Jump to the top-level directory of the current git repository."
    cd (git rev-parse --show-toplevel)
end
