#!/usr/bin/env fish
function install_bash_files
    echo "Installing bash files"
    for dotfile in $REPO_ROOT/bash/.{aliases,bashrc,bash_profile,functions}
        ln -i -s "$dotfile" ~
    end

    touch ~/.hushlogin
end

function install_fish_files
    echo "Installing fish configs"
    set -l FISH_CONFIGS_HOME "~/.config/fish"
    for fishConfig in $REPO_DIR/fish/{config.fish,fishfile}
        ln -i -s "$fishConfig" "$FISH_CONFIGS_HOME"
    end

    if not test -e ~/.config/fish/completions/docker.fish
        echo "Downloading the latest docker fish completions"
        command -v docker; and curl https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
    end
end

function install_st3_files
    echo "Installing Sublime Text 3 files"
    set -l SUBLIME_PREFERENCES_HOME "~/Library/Application Support/Sublime Text 3/Packages/User"
    for sublimeSettingsFile in "$REPO_DIR/st3/"
        ln -i -s "$sublimeSettingsFile" "$SUBLIME_PREFERENCES_HOME"
    end
end

function install_git_files
    echo "Installing git configs"
    for dotfile in $REPO_ROOT/git/.{gitconfig,gitignore_global}
        ln -i -s $dotfile ~
    end

    if not test -e ~/.git-completion.bash
        echo "Downloading the latest git-completion Bash script."
        curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
    end

end

function install_iterm2_files
    echo "Installing iterm2 settings"
    # Specify iTerm2's preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$REPO_ROOT/iterm2"
    # Configure iTerm2 to load and save preferences from that folder
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
end

set -l REPO_ROOT (dirname (status --current-filename))

install_bash_files
install_fish_files
install_st3_files
install_git_files
install_iterm2_files

echo "Done"