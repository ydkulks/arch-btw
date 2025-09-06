#!/bin/bash

# Kill previous instance
pkill -f "wifi-status.sh"

# Clean named pipes
rm -f /tmp/eww-wifi-icon /tmp/eww-wifi-ssid

# Start script again
sh ~/.config/eww/statusbar/scripts/wifi-status.sh &

# Stop eww statusbar
eww close statusbar

# Start eww statusbar
eww daemon && eww -c ~/.config/eww/statusbar open statusbar
