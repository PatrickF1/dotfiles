echo "Configuring OS X."

# Use a very audible but not jarring system alert sound
defaults write -g  com.apple.sound.beep.sound /System/Library/Sounds/Purr.aiff

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Use list view in all Finder windows by default
# Codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Keep dock right on the right side to save vertical screen real estate
# and to prevent it from acccidentally being moved between monitors
defaults write com.apple.dock 'orientation' -string 'right'

# Prevent Dock icons from bouncing
defaults write com.apple.dock no-bouncing -bool true

# Show the Finder path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Expand the save and print panels by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable automatic emoji substitution (i.e. use plain text smileys)
# defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

killall Dock
killall Finder
echo "Done."