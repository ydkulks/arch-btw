#!/bin/bash

# Directory containing your Hyprland scripts
SCRIPT_DIR="$HOME/.config/hypr/scripts/"

# Ensure the directory exists
if [ ! -d "$SCRIPT_DIR" ]; then
    echo "Script directory not found: $SCRIPT_DIR"
    exit 1
fi

# Get a list of executable files (file name only)
SCRIPTS=($(find "$SCRIPT_DIR" -maxdepth 1 -type f -executable -printf "%f\n" | sort))

# Check if there are scripts to run
if [ ${#SCRIPTS[@]} -eq 0 ]; then
    notify-send "No executable scripts found in $SCRIPT_DIR"
    exit 1
fi

# Show the file names in rofi
SELECTED=$(printf "%s\n" "${SCRIPTS[@]}" | rofi -dmenu -p "󰯁 ")

# Exit if nothing selected
[ -z "$SELECTED" ] && exit 0

# Build full path and execute the script
"$SCRIPT_DIR/$SELECTED" &
##!/bin/bash

## Directory containing your Hyprland-related scripts
#SCRIPT_DIR="$HOME/.config/hypr/scripts/"

## Check if directory exists
#if [ ! -d "$SCRIPT_DIR" ]; then
#    echo "Script directory not found: $SCRIPT_DIR"
#    exit 1
#fi

## Use rofi to select a script
#SELECTED_SCRIPT=$(find "$SCRIPT_DIR" -maxdepth 1 -type f -executable | sort | rofi -dmenu -p "󰯁 ")

## Exit if no selection
#[ -z "$SELECTED_SCRIPT" ] && exit 0

## Run the selected script in the background
#"$SELECTED_SCRIPT" &
