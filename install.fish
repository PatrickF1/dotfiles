#!/usr/bin/env fish
function install_bash_files
    echo "Installing bash files"
    for file in $repo_root/bash/.{aliases,bashrc,bash_profile,functions}
        ln -i -s "$file" ~
    end

    touch ~/.hushlogin
end

function install_fish_files
    echo "Installing fish configs"
    set -l fish_configs_home "$HOME/.config/fish"
    for file in $repo_root/fish/{config.fish,fishfile}
        ln -i -s "$file" "$fish_configs_home"
    end

    # make the path to this repo's fish functions universally available so that config.fish can
    # prepend it to fish_function_path
    set -U dotfile_fish_functions_path "$repo_root/fish/functions"

    if not test -e ~/.config/fish/completions/docker.fish
        echo "Downloading the latest docker fish completions"
        command -v docker; and curl https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
    end

    # install the fisherman framework
    if not type -q fisher
        echo "Installing fisherman and fisherman plugins"
        curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
    end
end

function install_st3_files
    echo "Installing Sublime Text 3 files"
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin
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

    if not test -e ~/.git-completion.bash
        echo "Downloading the latest git-completion Bash script."
        curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
    end

end

function install_iterm2_files
    echo "Installing iterm2 settings"
    # Specify iTerm2's preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$repo_root/iterm2"
    # Configure iTerm2 to load and save preferences from that folder
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
end

set repo_root (dirname (realpath (status --current-filename)))

install_bash_files
install_fish_files
install_st3_files
install_git_files
install_iterm2_files

echo "Done"