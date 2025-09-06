#!/bin/sh

$CONFIG_DIR=$HOME/Projects/arch-btw

# Create symlinks for Hyprland
ln -s $CONFIG_DIR/.config/hypr/hyprland.conf $HOME/.config/hypr/hyprland.conf
ln -s $CONFIG_DIR/.config/hypr/scripts/ $HOME/.config/hypr/scripts

# Create symlinks for Hyprlock
ln -s $CONFIG_DIR/.config/hypr/hyprlock.conf $HOME/.config/hypr/hyprlock.conf

# Create symlinks for Waybar
ln -s $CONFIG_DIR/.config/waybar/ $HOME/.config/waybar

# # Create symlinks for Wofi
# ln -s $CONFIG_DIR/.config/wofi/ $HOME/.config/wofi
# chmod +x $HOME/.config/hypr/scripts/wofi_toggle.sh

# Create symlinks for Rofi
ln -s $CONFIG_DIR/.config/rofi/ $HOME/.config/rofi
# chmod +x $HOME/.config/hypr/scripts/wofi_toggle.sh

# Create symlinks for Dolphin
ln -s $CONFIG_DIR/.config/dolphinrc $HOME/.config
ln -s $CONFIG_DIR/.config/kdeglobals $HOME/.config
ln -s $CONFIG_DIR/.config/qt6ct $HOME/.config
ln -s $CONFIG_DIR/.config/mimeapps.list $HOME/.config

# Create symlink for Hyprpaper
ln -s $CONFIG_DIR/.config/hypr/hyprpaper.conf $HOME/.config/hypr/hyprpaper.conf

# Create symlink for Swaync
ln -s $CONFIG_DIR/.config/swaync/ $HOME/.config/swaync

# Create symlink for Eww
ln -s $CONFIG_DIR/.config/eww/ $HOME/.config/eww
ln -s $CONFIG_DIR/.config/networkmanager-dmenu/ $HOME/.config/networkmanager-dmenu
