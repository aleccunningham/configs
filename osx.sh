#/usr/bin/env sh

echo 'Automatically hide and show the Dock'
defaults write com.apple.dock autohide -bool true

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Expose hidden files and Library folder in Finder"
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

echo "Show full filename extensions (i.e. Evil.jpg.app)"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Disable Bonjour multicast advertisements"
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

echo "Disable macOS Captive Portal assistant utility probing unknown networks"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

echo "Disable crash report popup"
defaults write com.apple.CrashReporter DialogType none

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0.02

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
