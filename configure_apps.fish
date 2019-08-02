#!/usr/bin/env fish

echo "Pointing iterm2 to use settings in this repo."
set repo_root (dirname (realpath (status --current-filename)))
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$repo_root/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true