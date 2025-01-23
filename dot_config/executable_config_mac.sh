GITHUB_USERNAME=juadk

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/juadk/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/juadk/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install chezmoi to easily deploy dotfiles
brew install chezmoi

# Deploy Dotfiles
chezmoi init git@github.com:$GITHUB_USERNAME/dotfiles.git
chezmoi apply

# Install packages from homebrew using dump file
brew bundle --file=$HOME/.config/Brewfile 

# Fish configuration
echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish

##############################
# Install packages with asdf #
##############################

# Install Golang with asdf
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf global golang latest

# Install nodejs with asdf
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# Install yarn with asdf
asdf plugin add yarn https://github.com/twuni/asdf-yarn.git
asdf install yarn latest
asdf global yarn latest

# Install Python with asdf
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf install python latest
asdf global python latest

# Install Fisher plugin manager
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

##########################
# Configure Mac settings #
##########################

# Dock settings
# Configure the Dock size
defaults write com.apple.dock tilesize -int 56

# Use Dark for Dock
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Delete all apps from Dock
defaults write com.apple.dock persistent-apps -array

# Disable the "Are you sure you want to open this application?" dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Allow quitting Finder via ⌘ + Q
defaults write com.apple.finder QuitMenuItem -bool true

# Disable Finder sound
/usr/bin/defaults write com.apple.finder 'FinderSounds' -bool false

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Always expand Save Panel by default:
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Show Tab View
defaults write com.apple.finder ShowTabView -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Always expand Save Panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Default Finder view is List:
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Disable "natural" scrolling.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable show recent
defaults write com.apple.dock show-recents -bool FALSE
defaults write NSGlobalDomain NSRecentDocumentsLimit 0
defaults write -g NSNavRecentPlacesLimit -int 0

# Set the menu bar to turn black in dark mode
defaults write com.apple.universalaccess reduceTransparency 1

# Enable tap to click on Trackpad and login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.mouse.tapBehaviour -int 1

# Don't open files in Safari after downloading:
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Keep folders at the top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Default opening folder (command-N)  (""PfHm"" = Home ; "PfDe" = Desktop ; "PfDo" = Documents)
defaults write com.apple.finder NewWindowTargetPath -string "PfHm"

# Set location to save screenshots
mkdir ~/Pictures/Screenshots/
defaults write com.apple.screencapture location ~/Pictures/Screenshots/

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Kill affected applications
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

# Manual Steps #
# Copy .ssh folder
# Add Printer
