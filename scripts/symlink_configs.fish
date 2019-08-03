#!/usr/bin/env fish

function install_vim_files
    echo "Installing vim settings"

    set -l vimrc "$repo_root/vim/.vimrc"
    ln -i -s $vimrc ~/.vimrc
    ln -i -s $vimrc ~/.config/nvim/init.vim
end

set repo_root (dirname (realpath (status --current-filename)))

install_vim_files

echo "Done. Please start a new shell session for the changes to take effect."
