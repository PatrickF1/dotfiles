# meant to be called interactively
function _cd_git_root --description "Jump to the top-level directory of the current git repository."
    cd (git rev-parse --show-toplevel)
    commandline --function repaint
end
