#!/usr/bin/env fish

echo "Pointing iterm2 to use settings in Dropbox."
set repo_root (dirname (realpath (status --current-filename)))
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/Dropbox/Settings"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true