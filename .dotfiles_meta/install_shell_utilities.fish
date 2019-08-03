#!/usr/bin/env fish

set -l path_to_shell (which fish)
if not grep -q "$path_to_shell" /etc/shells
    echo "Setting default shell to $path_to_shell"
    echo "$path_to_shell" | sudo tee -a /etc/shells > /dev/null
    chsh -s "$path_to_shell"
end

if not test -f ~/.local/share/nvim/site/autoload/plug.vim
    echo "Installing vim-plug for neovim."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

if not test -f ~/.git-completion.bash
    echo "Installing the latest git-completion script for bash."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
end

if not test -e ~/.config/fish/completions/docker.fish
    echo "Installing the latest docker completions for fish."
    curl https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
end

if not type -q fisher
    echo "Installing fisher and fisher plugins."
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
    fish -c fisher
end