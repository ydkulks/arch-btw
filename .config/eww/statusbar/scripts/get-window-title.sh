#!/bin/sh

# hyprctl activewindow -j | jq --raw-output .title
# socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 awk -F '>>|,' '/^activewindow>>/{print $3}'

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | \
stdbuf -o0 awk -F '>>|,' '/^activewindow>>/{print $3}' | \
while read -r title; do
    max_length=50
    if [ ${#title} -gt $max_length ]; then
        echo "${title:0:47}..."
    else
        echo "$title"
    fi
done
