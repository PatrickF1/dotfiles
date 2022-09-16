# source: https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.fish
function n --wraps nnn --description 'support nnn cd on quit'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
        echo "nnn is already running"
        return
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" without changing the paths.
    set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"

    command nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end
