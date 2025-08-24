#!/bin/sh

# Create symlinks for Hyprland
ln -s $HOME/Projects/arch-btw/.config/hypr/hyprland.conf $HOME/.config/hypr/hyprland.conf
ln -s $HOME/Projects/arch-btw/.config/hypr/scripts/ $HOME/.config/hypr/scripts

# Create symlinks for Hyprlock
ln -s $HOME/Projects/arch-btw/.config/hypr/hyprlock.conf $HOME/.config/hypr/hyprlock.conf

# Create symlinks for Waybar
ln -s $HOME/Projects/arch-btw/.config/waybar/ $HOME/.config/waybar

# Create symlinks for Wofi
ln -s $HOME/Projects/arch-btw/.config/wofi/ $HOME/.config/wofi
chmod +x $HOME/.config/hypr/scripts/wofi_toggle.sh

# Create symlinks for Dolphin
ln -s $HOME/Projects/arch-btw/.config/dolphinrc $HOME/.config
ln -s $HOME/Projects/arch-btw/.config/kdeglobals $HOME/.config
ln -s $HOME/Projects/arch-btw/.config/qt6ct $HOME/.config
ln -s $HOME/Projects/arch-btw/.config/mimeapps.list $HOME/.config

# Create symlink for Hyprpaper
ln -s $HOME/Projects/arch-btw/.config/hypr/hyprpaper.conf $HOME/.config/hypr/hyprpaper.conf
