echo "Configuring OS X."
# Close any open System Preferences panes to prevent them from overriding
# the settings being configured
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# Finder                                                                      #
###############################################################################

# Use list view in all Finder windows by default
# Codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning shown when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set the Home folder as the default path for new Finder tabs
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"

# Show the Finder path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

###############################################################################
# Dock                                                                        #
###############################################################################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Keep Dock right on the right side to save vertical screen real estate
# and to prevent it from acccidentally being moved between monitors
defaults write com.apple.dock 'orientation' -string 'right'

# Prevent Dock icons from bouncing
defaults write com.apple.dock no-bouncing -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Minimize windows using the "scale" effect, which is much faster than "genie"
defaults write com.apple.Dock mineffect scale

###############################################################################
# Input Devices                                                               #
###############################################################################

# set a moderate tracking and scrolling speed for the mouse
defaults write "Apple Global Domain" "com.apple.mouse.scaling" 0.65
defaults write "Apple Global Domain" "com.apple.scrollwheel.scaling" 0.4

###############################################################################
# Miscellaneous                                                               #
###############################################################################

# Use a very audible but not jarring system alert sound
defaults write -g  com.apple.sound.beep.sound /System/Library/Sounds/Purr.aiff

# Expand the save and print panels by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Restart affected apps so changes take effect immediately
killall Dock
killall Finder

echo "Done."