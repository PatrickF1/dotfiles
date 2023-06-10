function dot --wraps=git --description 'Manage dotfiles repository with home as working directory'
    git --git-dir="$HOME/Code/dotfiles/.git" --work-tree="$HOME" $argv
end