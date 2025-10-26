#!/bin/bash
# Minimal rice mode - Subtle transparency with gaps, no borders

# Set opacity to 0.75 for both active and inactive windows (from your commented config)
hyprctl keyword decoration:active_opacity 0.75
hyprctl keyword decoration:inactive_opacity 0.75

# Set gaps
hyprctl keyword general:gaps_in 5
hyprctl keyword general:gaps_out 10

# No borders
hyprctl keyword general:border_size 0

# Optional: Keep rounding disabled
hyprctl keyword decoration:rounding 0

notify-send "Hyprland" "Minimal rice mode activated" -t 2000
