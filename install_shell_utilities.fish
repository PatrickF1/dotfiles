#!/usr/bin/env fish

# vim-plug for neovim
if not test -f ~/.local/share/nvim/site/autoload/plug.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

if not test -f ~/.git-completion.bash
    echo "Downloading the latest git-completion Bash script."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
end