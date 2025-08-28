#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Find wallpapers and trim the path before $WALLPAPER_DIR
mapfile -t RELATIVE_PATHS < <(
    find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) \
    | sort \
    | sed "s|^$WALLPAPER_DIR||"
)

# Show relative paths in rofi
SELECTED_RELATIVE=$(printf '%s\n' "${RELATIVE_PATHS[@]}" | rofi -dmenu -p "󰋩 ")

# Exit if no selection
[ -z "$SELECTED_RELATIVE" ] && exit 0

# Reconstruct full path
SELECTED_WALLPAPER="$WALLPAPER_DIR$SELECTED_RELATIVE"

# Get all active monitor names from hyprctl
mapfile -t MONITORS < <(hyprctl monitors -j | jq -r '.[].name')

# Reload wallpaper config
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$SELECTED_WALLPAPER"

# Set wallpaper for each monitor
for MON in "${MONITORS[@]}"; do
    hyprctl hyprpaper wallpaper "$MON,$SELECTED_WALLPAPER"
done
