#!/usr/bin/env fish

# vim-plug for neovim
if not test -f ~/.local/share/nvim/site/autoload/plug.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end
