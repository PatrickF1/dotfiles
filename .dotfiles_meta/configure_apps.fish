#!/usr/bin/env fish

# Point iterm2 to stored settings Dropbox
set repo_root (dirname (realpath (status --current-filename)))
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/Dropbox/Settings"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Disabling checking if keyboard shortcuts are on in Mailplane
defaults write com.mailplaneapp.Mailplane3 DisableCheckKeyboardShortcuts -bool YES