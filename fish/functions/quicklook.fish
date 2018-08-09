#!/usr/bin/env fish
# original from https://github.com/oh-my-fish/plugin-osx/blob/master/functions/ql.fish
function quicklook -d "Quick Look a specified file or directory"
  if [ (count $argv) -gt 0 ]
    # start qlmanage in the background and redirect its stdout and stderr to /dev/null
    qlmanage -p $argv >/dev/null ^&1 &
  else
    echo "No arguments given"
    return 1
  end
end
