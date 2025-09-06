#!/bin/bash

DIRECTION="$1"

case "$DIRECTION" in
  "up")
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  "down")
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
esac
