#!/usr/bin/env fish
# original from https://github.com/oh-my-fish/plugin-osx/blob/master/functions/pfd.fish
function finder_path -d "Return the path of the frontmost Finder window"
    osascript 2>/dev/null -e '
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell'
end
