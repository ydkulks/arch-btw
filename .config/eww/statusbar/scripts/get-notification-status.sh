#!/bin/bash

# prev_icon=""

# while true; do
#     count=$(swaync-client -c 2>/dev/null)

#     if [ -z "$count" ]; then
#         # Fallback if swaync-client fails
#         icon=""
#     elif [ "$count" -gt 0 ]; then
#         icon=""
#     else
#         icon=""
#     fi

#     if [ "$icon" != "$prev_icon" ]; then
#         echo "$icon"
#         prev_icon="$icon"
#     fi

#     sleep 2
# done

# Get number of pending notifications
count=$(swaync-client -c)

if [ "$count" -gt 0 ]; then
    echo ""  # filled bell (notifications present)
else
    echo ""  # empty bell (no notifications)
fi
