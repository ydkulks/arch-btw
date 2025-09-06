#!/bin/bash

# Initial output
print_icon() {
  MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

  if [ "$MUTED" = "yes" ]; then
    ICON=" "
  elif [ "$VOLUME" -lt 30 ]; then
    ICON=" "
  elif [ "$VOLUME" -lt 70 ]; then
    ICON=" "
  else
    ICON=" "
  fi

  echo "$ICON"
}

# Output the initial state
print_icon

# Listen for events, flush with socat
pactl subscribe | socat -u STDIN STDOUT | while read -r line; do
  if echo "$line" | grep -q "sink"; then
    print_icon
  fi
done
