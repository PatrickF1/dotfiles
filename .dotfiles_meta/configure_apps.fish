#!/usr/bin/env fish

# Point iterm2, Dash, and Alfred to settings stored in Dropbox
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/Dropbox/Settings"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
defaults write com.kapeli.dashdoc syncFolderPath -string "$HOME/Dropbox/Settings"
defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string "$HOME/Dropbox/Settings"

# Disable checking if keyboard shortcuts are on in Mailplane
defaults write com.mailplaneapp.Mailplane3 DisableCheckKeyboardShortcuts -bool YES
