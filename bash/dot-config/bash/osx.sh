# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Shorter initial delay before repeating (about 200ms)
defaults write -g InitialKeyRepeat -int 15

# Faster repeat rate (about 30ms between repeats)
defaults write -g KeyRepeat -int 2

# Enable tap-to-click for trackpad
defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 2
defaults write -g com.apple.mouse.tapBehavior -int 2

# Enable Reduce Motion
defaults write com.apple.universalaccess reduceMotion -bool true
