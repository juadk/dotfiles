#/bin/bash

# Install packages
sudo pacman -S hyprland wofi alacritty ttf-font-awesome wlogout hyprpaper wlogout swaylock-effects swtpm


# Deploy config
ln -fs $HOME/Dev/dotfiles/swaylock $HOME/.config/swaylock

ln -fs $HOME/Dev/dotfiles/wlogout $HOME/.config/wlogout

ln -fs $HOME/Dev/dotfiles/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml

ln -fs $HOME/Dev/dotfiles/hypr/hyprland.conf $HOME/.config/hypr/hyprland.conf
ln -fs $HOME/Dev/dotfiles/hypr/hyprpaper.conf $HOME/.config/hypr/hyprpaper.conf


ln -fs $HOME/Dev/dotfiles/waybar/scripts $HOME/.config/waybar/scripts
ln -fs $HOME/Dev/dotfiles/waybar/config $HOME/.config/waybar/config
ln -fs $HOME/Dev/dotfiles/waybar/style.css $HOME/.config/waybar/style.css

