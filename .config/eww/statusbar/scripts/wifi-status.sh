#!/bin/bash

# Run this script using your WM config
# Example (Hyprland):
# exec-once = sh $HOME/.config/eww/statusbar/scripts/wifi-status.sh

# PIPE="/tmp/eww-wifi-status"
# [ -p "$PIPE" ] || mkfifo "$PIPE"

# get_wifi_icon() {
#   status=$(nmcli -t -f WIFI g)
#   if [[ "$status" != "enabled" ]]; then
#     echo "󰤭"
#     return
#   fi

#   connected=$(nmcli -t -f ACTIVE,SSID dev wifi | grep "^yes")
#   if [[ -z "$connected" ]]; then
#     echo "󰤮"
#     return
#   fi

#   signal=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^\*' | cut -d: -f2)

#   if [ "$signal" -ge 80 ]; then echo "󰤨"
#   elif [ "$signal" -ge 60 ]; then echo "󰤥"
#   elif [ "$signal" -ge 40 ]; then echo "󰤢"
#   elif [ "$signal" -ge 20 ]; then echo "󰤟"
#   else echo "󰤯"
#   fi
# }

# # Use exec to keep the pipe open
# while true; do
#   icon=$(get_wifi_icon)
#   echo "$icon" > "$PIPE"
#   sleep 5
# done

#!/bin/bash

ICON_PIPE="/tmp/eww-wifi-icon"
SSID_PIPE="/tmp/eww-wifi-ssid"

[ -p "$ICON_PIPE" ] || mkfifo "$ICON_PIPE"
[ -p "$SSID_PIPE" ] || mkfifo "$SSID_PIPE"

get_wifi_status() {
  status=$(nmcli -t -f WIFI g)
  if [[ "$status" != "enabled" ]]; then
    echo "󰤭" > "$ICON_PIPE"
    echo "WiFi Disabled" > "$SSID_PIPE"
    return
  fi

  connected_line=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi | grep "^yes")
  if [[ -z "$connected_line" ]]; then
    echo "󰤮" > "$ICON_PIPE"
    echo "Not Connected" > "$SSID_PIPE"
    return
  fi

  ssid=$(echo "$connected_line" | cut -d: -f2)
  signal=$(echo "$connected_line" | cut -d: -f3)

  if [ "$signal" -ge 80 ]; then icon="󰤨"
  elif [ "$signal" -ge 60 ]; then icon="󰤥"
  elif [ "$signal" -ge 40 ]; then icon="󰤢"
  elif [ "$signal" -ge 20 ]; then icon="󰤟"
  else icon="󰤯"
  fi

  echo "$icon" > "$ICON_PIPE"
  echo "$ssid" > "$SSID_PIPE"
}

while true; do
  get_wifi_status
  sleep 5
done
