#!/usr/bin/env fish

# param 1: string that will match the application name if and only if it is installed in /Applications
# param 2: the name of the brew cask, used to install the application if needed
function install_if_not_installed
    if ls /Applications | grep -q "$argv[1]"
        echo "Not installing $argv[1] because it is already installed."
    else
        brew cask install "$argv[2]"
    end
end

if not type -q brew
    echo 'Homebrew must be installed in order to use this script!' >&2
    exit 1
end

install_if_not_installed Dash Dash
install_if_not_installed "Google Chrome" google-chrome
install_if_not_installed Dropbox dropbox
install_if_not_installed 1Password 1password
install_if_not_installed Alfred alfred
install_if_not_installed "Sublime Text" sublime-text
install_if_not_installed Postico postico
install_if_not_installed Things things
install_if_not_installed VLC vlc
install_if_not_installed Paintbrush paintbrush
install_if_not_installed TotalFinder totalfinder
install_if_not_installed Spotify spotify
install_if_not_installed iTerm iterm2
install_if_not_installed Focus focus
install_if_not_installed Mailplane mailplane

echo "Pointing iterm2 to use settings in this repo."
set repo_root (dirname (realpath (status --current-filename)))
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$repo_root/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true