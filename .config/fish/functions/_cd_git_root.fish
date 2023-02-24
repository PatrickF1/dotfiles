# meant to be called interactively
function _cd_git_root --description "Jump to the top-level directory of the current git repository."
    set top_level_dir (git rev-parse --show-toplevel)
    if test $status -eq 0
        if test $top_level_dir != (pwd)
            cd $top_level_dir
        else
            echo "Already in top level of git repo" >&2
        end
    end
    commandline --function repaint
end
