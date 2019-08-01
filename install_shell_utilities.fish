#!/usr/bin/env fish

# vim-plug for neovim
if not test -f ~/.local/share/nvim/site/autoload/plug.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

# git completion for bash
if not test -f ~/.git-completion.bash
    echo "Downloading the latest git-completion Bash script."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
end

# docker completions for fish
if not test -e ~/.config/fish/completions/docker.fish
    echo "Downloading the latest docker fish completions"
    command -v docker; and curl https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
end

# fisher framework
if not type -q fisher
    echo "Installing fisher and fisher plugins"
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
    fish -c fisher
end
