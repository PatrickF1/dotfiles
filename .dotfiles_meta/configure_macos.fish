#!/usr/bin/env fish

echo "Configuring macOS and built-in apps"
# Close any open System Preferences panes to prevent them from overriding
# the settings being configured
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# Finder                                                                      #
###############################################################################

# Use list view in all Finder windows by default
# Codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv

# Disable the warning shown when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set the Home folder as the default path for new Finder tabs
defaults write com.apple.finder NewWindowTarget -string PfLo
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"

# Show the Finder path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# Don't show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool false

# Disable animation for opening the Get Info window
defaults write com.apple.finder DisableAllAnimations -bool true

# Set desktop wallpaper to something minimal and slightly soothing
set wallpaper_path (realpath (status dirname))/rings_wallpaper.png
osascript -e "tell application \"Finder\" to set desktop picture to \"$wallpaper_path\" as POSIX file"

###############################################################################
# Keyboard & Mouse                                                            #
###############################################################################

# Configure key repeat to be be blazingly fast with a moderate initial delay (ints are in ms)
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable automatic substitutions that get in the way when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a moderate tracking and scrolling speed for the mouse
defaults write "Apple Global Domain" "com.apple.mouse.scaling" 0.65
defaults write "Apple Global Domain" "com.apple.scrollwheel.scaling" 0.4

###############################################################################
# Dock                                                                        #
###############################################################################

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Keep Dock right on the right side to save vertical screen real estate
# and to prevent it from acccidentally being moved between monitors
defaults write com.apple.dock orientation -string right

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
# Miscellaneous                                                               #
###############################################################################

# Use a clear, short, but non-jarring system alert sound
defaults write -g com.apple.sound.beep.sound /System/Library/Sounds/Tink.aiff

# Expand the save and print panels by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string none

# Prevent Photos from automatically opening when plugging in an iPhone
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Sort Activity Monitor results by highest CPU usage first
defaults write com.apple.ActivityMonitor SortColumn -string CPUUsage
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Root level configuration                                                    #
###############################################################################
echo "Configuring root level settings"

# Don't back up memory during sleep
sudo pmset -a hibernatemode 0

# Don't wake for network access
sudo pmset -a womp 0

# System Settings > General > About > Name
sudo scutil --set ComputerName "Patrick's MacBook"

# System Settings > Sharing > Local hostname
sudo scutil --set LocalHostName Patrick-MacBook

###############################################################################
# Third party apps                                                            #
###############################################################################

echo "Configuring third party apps"

set settings_path "$HOME/Dropbox/Settings"
# Point iterm2, Dash, and Alfred to settings stored in Dropbox
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string $settings_path
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
defaults write com.kapeli.dashdoc syncFolderPath -string $settings_path
defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string $settings_path

# Disable checking if keyboard shortcuts are on in Mailplane
defaults write com.mailplaneapp.Mailplane3 DisableCheckKeyboardShortcuts -bool true

# Configure Postico
defaults write at.eggerapps.Postico AlternatingRows -bool true
defaults write at.eggerapps.Postico IndentWithSpaces -bool true
defaults write at.eggerapps.Postico QueryViewFontSize -int 14
defaults write at.eggerapps.Postico TableViewFontSize -int 14
defaults write at.eggerapps.Postico TableViewRowsPerPage -int 200

###############################################################################
# Finish                                                                      #
###############################################################################

# Restart affected apps so changes take effect immediately
for app in Finder Dock cfprefsd SystemUIServer iTerm2 Dash Alfred Mailplane Postico
    killall -q $app
end

echo "Done. You may need to restart currently running applications for new settings to kick in."
