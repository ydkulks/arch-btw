#!/bin/bash

print_percent() {
  MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

  if [ "$MUTED" = "yes" ]; then
    echo "Muted"
  else
    echo "$VOLUME"
  fi
}

# Initial output
print_percent

# Listen to sink events
pactl subscribe | socat -u STDIN STDOUT | while read -r line; do
  if echo "$line" | grep -q "sink"; then
    print_percent
  fi
done
