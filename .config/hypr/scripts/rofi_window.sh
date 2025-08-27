#!/bin/bash

# Create a mapping: visible_line -> address
declare -A window_map

# Build the list
window_list=$(hyprctl clients -j | jq -r '
  .[] | "\(.class) ❯ \(.title)::: \(.address)"
' | while IFS=":::" read -r entry address; do
  # Store mapping
  window_map["$entry"]=$address
  # Output only the visible entry for rofi
  echo "$entry"
done)

# Show only visible lines in Rofi
selected=$(echo "$window_list" | rofi -dmenu -p " ")

# Use selected entry to get the address
address=$(hyprctl clients -j | jq -r '
  .[] | "\(.class) ❯ \(.title):::\(.address)"
' | grep -F "$selected" | awk -F ':::' '{print $2}')

# Focus the selected window
# [[ -n "$address" ]] && hyprctl dispatch focuswindow address:$address
if [[ -n "$address" ]]; then
  hyprctl dispatch focuswindow address:"$address"
  hyprctl dispatch bringactivetotop
fi
