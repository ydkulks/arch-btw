#!/bin/bash

# Path to Hyprland config
CONFIG="$HOME/Projects/arch-btw/.config/hypr/hyprland.conf"

# Nerd Font icon for $mainMod
mainModIcon="󰣇 "

grep '^bind' "$CONFIG" | grep -v '#' |
  sed 's/^bind\s*=\s*//g' \
  | sed "s/\\\$mainMod/$mainModIcon/g" \
  | sed 's/,/ + /1; s/,/ → /1' \
  | rofi -dmenu -p "  "

##!/bin/bash

## Path to your Hyprland config
#CONFIG="$HOME/Projects/arch-btw/.config/hypr/hyprland.conf"

## Extract only lines with 'bind' and ignore comments
#grep '^bind' "$CONFIG" | grep -v '#' |
#  sed 's/^bind\s*=\s*//g' |
#  sed 's/,/ + /1; s/,/ → /1' |
#  rofi -dmenu -p "  "
