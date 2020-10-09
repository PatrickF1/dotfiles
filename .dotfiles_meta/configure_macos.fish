# heavily adapted from https://github.com/mathiasbynens/dotfiles/blob/master/.macos

echo "Configuring macOS"
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

# Don't show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool false

###############################################################################
# Keyboard                                                                    #
###############################################################################

# Configure key repeat to be be blazingly fast with a moderate initial delay (ints are in ms)
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable automatically adding a period when double-spacing
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

###############################################################################
# Dock                                                                        #
###############################################################################

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

# Speed up the animation for hiding and showing the dock
defaults write com.apple.dock autohide-time-modifier -float 0.25

# Shrink the size of Dock app icons for more horizontal screen real estate
defaults write com.apple.dock tilesize -int 52

###############################################################################
# Input Devices                                                               #
###############################################################################

# set a moderate tracking and scrolling speed for the mouse
defaults write "Apple Global Domain" "com.apple.mouse.scaling" 0.65
defaults write "Apple Global Domain" "com.apple.scrollwheel.scaling" 0.4

# prevent Photos from automatically opening when plugging in an iPhone
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Miscellaneous                                                               #
###############################################################################

# Use a very audible but not jarring system alert sound
defaults write -g com.apple.sound.beep.sound /System/Library/Sounds/Purr.aiff

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

# Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"

###############################################################################
# Root level configuration                                                    #
###############################################################################
echo "The last few configurations will require root access."

# On sleep, copy the contents of memory to disk and turn off memory, saving
# power but adding an ~8 second delay to waking up
sudo pmset -a hibernatemode 25

###############################################################################
# Finish                                                                      #
###############################################################################

# Restart affected apps so changes take effect immediately
killall Dock
killall Finder

echo "Done"