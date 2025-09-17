#!/bin/bash

# Wallpaper folder
FOLDER="$HOME/Pictures/Wallpapers"

# Optional script to run after setting wallpaper (leave empty if not needed)
# SCRIPT="$HOME/scripts/hypr-refresh"

# Ensure folder exists
[ ! -d "$FOLDER" ] && {
    notify-send "Wallpaper folder does not exist: $FOLDER"
    echo "Wallpaper folder does not exist: $FOLDER"
    exit 1
}

# Display image picker
choose_wallpaper() {
  if command -v nsxiv >/dev/null; then
    # nsxiv: Select with preview (returns full paths)
    nsxiv -otr "$FOLDER"/* 
    # nsxiv -otb $(find "$FOLDER" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.webp' \) | sort)
  else
    # fallback: rofi -dmenu
    local files_list
    files_list=$(find "$FOLDER" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) -printf "%f\n" | sort)

    local choice
    choice=$(printf "Random\n%s" "$files_list" | rofi -dmenu -p "󰋩 ")

    # handle cancellation
    [ -z "$choice" ] && return 1

    # handle random selection
    if [ "$choice" == "Random" ]; then
      find "$FOLDER" -type f | shuf -n 1
    else
      echo "$FOLDER/$choice"
    fi
  fi
}

# Run the selection and get first valid file
CHOICE=$(choose_wallpaper | head -n 1 | xargs)

# Exit if nothing selected
[ -z "$CHOICE" ] && {
    notify-send "No image selected."
    echo "No image selected."
    exit 0
}

# Ensure hyprpaper is running
if ! pgrep -x hyprpaper > /dev/null; then
    hyprpaper &
    sleep 1
fi

# Set wallpaper using hyprpaper
mapfile -t MONITORS < <(hyprctl monitors -j | jq -r '.[].name')

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$CHOICE"

for MON in "${MONITORS[@]}"; do
    hyprctl hyprpaper wallpaper "$MON,$CHOICE"
done

# Optional: run custom refresh script
# [ -x "$SCRIPT" ] && "$SCRIPT"

##!/bin/bash

## Directory containing your wallpapers
#WALLPAPER_DIR="$HOME/Pictures/"

## Check if the directory exists
#if [ ! -d "$WALLPAPER_DIR" ]; then
#    echo "Wallpaper directory not found: $WALLPAPER_DIR"
#    exit 1
#fi

## Find wallpapers and trim the path before $WALLPAPER_DIR
#mapfile -t RELATIVE_PATHS < <(
#    find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) \
#    | sort \
#    | sed "s|^$WALLPAPER_DIR||"
#)

## Show relative paths in rofi
#SELECTED_RELATIVE=$(printf '%s\n' "${RELATIVE_PATHS[@]}" | rofi -dmenu -p "󰋩 ")

## Exit if no selection
#[ -z "$SELECTED_RELATIVE" ] && exit 0

## Reconstruct full path
#SELECTED_WALLPAPER="$WALLPAPER_DIR$SELECTED_RELATIVE"

## Get all active monitor names from hyprctl
#mapfile -t MONITORS < <(hyprctl monitors -j | jq -r '.[].name')

## Reload wallpaper config
#hyprctl hyprpaper unload all
#hyprctl hyprpaper preload "$SELECTED_WALLPAPER"

## Set wallpaper for each monitor
#for MON in "${MONITORS[@]}"; do
#    hyprctl hyprpaper wallpaper "$MON,$SELECTED_WALLPAPER"
#done
