#!/usr/bin/env fish

function install_st3_files
    set -l sublime_preferences_home "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
    for file in "$repo_root/st3/"*
        ln -i -s "$file" "$sublime_preferences_home"
    end
end

function install_git_files
    echo "Installing git configs"
    for file in $repo_root/git/.{gitconfig,gitignore_global}
        ln -i -s $file ~
    end

    echo "Installing git shalector"
    ln -i -s $repo_root/git/git-shalector /usr/local/bin
end

function install_vim_files
    echo "Installing vim settings"

    set -l vimrc "$repo_root/vim/.vimrc"
    ln -i -s $vimrc ~/.vimrc
    ln -i -s $vimrc ~/.config/nvim/init.vim
end

set repo_root (dirname (realpath (status --current-filename)))

install_st3_files
install_git_files
install_vim_files

echo "Done. Please start a new shell session for the changes to take effect."
