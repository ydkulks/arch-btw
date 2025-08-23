#!/bin/bash

# Define the command to launch rofi
WOFI_COMMAND="wofi --show drun"

# Check if wofi is already running
if pgrep wofi; then
    # If it is, kill the running instance
    pkill -f wofi
else
    # If it's not, launch it
    eval $WOFI_COMMAND
fi
