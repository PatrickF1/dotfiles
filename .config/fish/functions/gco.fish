# meant to be called interactively
function gco --description "Switch to a branch, or cd into its worktree if it's already checked out elsewhere."
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo 'Not in a git repository.' >&2
        return 1
    end

    if test (count $argv) -eq 0
        echo 'usage: gco <branch>' >&2
        return 2
    end

    set -l branch $argv[1]

    # Scan worktrees for one that already has this branch checked out. git refuses
    # a plain checkout in that case ("already checked out at <path>"); instead of
    # erroring, we just go there. --porcelain emits, per worktree:
    #     worktree <path>
    #     HEAD <sha>
    #     branch refs/heads/<name>   (absent when detached/bare)
    set -l found_wt ''
    set -l wt ''
    for line in (git worktree list --porcelain)
        set -l field (string split --max 1 ' ' -- $line)
        switch $field[1]
            case worktree
                set wt $field[2]
            case branch
                if test "$field[2]" = "refs/heads/$branch"
                    set found_wt $wt
                    break
                end
        end
    end

    if test -n "$found_wt"
        if test "$found_wt" = (git rev-parse --show-toplevel)
            echo "Already in the worktree for '$branch'."
        else
            echo "→ $found_wt"
            cd $found_wt
        end
        return 0
    end

    # Not checked out in any worktree: ordinary switch. Forwards all args, so
    # remote-tracking DWIM (gco somebranch) and flags (gco -c new) still work.
    git switch $argv
end
