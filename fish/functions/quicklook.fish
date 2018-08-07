#!/usr/bin/env fish
# original from https://github.com/oh-my-fish/plugin-osx/blob/master/functions/ql.fish
function quicklook -d "Quick Look a specified file or directory"
  if [ (count $argv) -gt 0 ]
    qlmanage >/dev/null ^/dev/null -p $argv &
  else
    echo "No arguments given"
    return 1
  end
end
