#!/usr/bin/env fish

set -l path_to_shell (which fish)
if not grep -q "$path_to_shell" /etc/shells
    echo "Setting default shell to $path_to_shell"
    echo "$path_to_shell" | sudo tee -a /etc/shells >/dev/null
    chsh -s "$path_to_shell"
end

echo "Installing vim-plug for neovim"
curl --create-dirs --location --output ~/.local/share/nvim/site/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing the latest git-completion script for bash"
curl --create-dirs --location --output ~/.config/bash/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo "Installing fisher and fisher plugins"
curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
fish -c fisher update

echo "Installing plugins for asdf"
asdf plugin add python
asdf plugin add ruby