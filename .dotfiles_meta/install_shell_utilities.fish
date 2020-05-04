#!/usr/bin/env fish

set -l path_to_shell (which fish)
if not grep -q "$path_to_shell" /etc/shells
    echo "Setting default shell to $path_to_shell"
    echo "$path_to_shell" | sudo tee -a /etc/shells > /dev/null
    chsh -s "$path_to_shell"
end

echo "Installing vim-plug for neovim"
curl --create-dirs --location --output ~/.local/share/nvim/site/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing the latest git-completion script for bash"
curl --create-dirs --location --output ~/.config/bash/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
echo "Installing the latest docker completions for fish"
curl --create-dirs --location --output ~/.config/fish/completions/docker.fish https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish

echo "Installing fisher and fisher plugins"
curl --create-dirs --location --output ~/.config/fish/functions/fisher.fish https://git.io/fisher
fish -c fisher

echo "Installing plugins for asdf"
asdf plugin add python
asdf plugin add ruby