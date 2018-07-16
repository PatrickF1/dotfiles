#!/usr/bin/env fish
function install_bash_files
    echo "Installing bash files"
    for dotfile in $REPO_ROOT/bash/.{aliases,bashrc,bash_profile,functions}
        ln -i -s $dotfile ~
    end

    touch ~/.hushlogin

    if not test -e ~/.git-completion.bash
       echo "Downloading the latest git-completion Bash script."
       curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
    end
end

function install_fish_files
    echo "Installing fish configs"
    set -l FISH_CONFIGS_HOME "$HOME/.config/fish"
    for fishConfig in $REPO_DIR/fish/{config.fish,fishfile}
        ln -i -s "$fishConfig" "$FISH_CONFIGS_HOME"
    end
end

function install_st3_files

end

function install_git_files
    for dotfile in $REPO_ROOT/git/.{gitconfig,gitignore_global}
        ln -i -s $dotfile ~
    end

    if not test -e ~/.git-completion.bash
        echo "Downloading the latest git-completion Bash script."
        curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
    end

end

function install_iterm2_files
end
echo "Installing dotfiles and configs for the current user"
set -l REPO_ROOT (dirname (status --current-filename))

install_bash_files
install_fish_files
install_st3_files
install_git_files
install_iterm2_files