#!/bin/bash
# Focus mode - Maximum clarity, no distractions

# Set opacity to full (1.0) for both active and inactive windows
hyprctl keyword decoration:active_opacity 1.0
hyprctl keyword decoration:inactive_opacity 1.0

# Remove all gaps
hyprctl keyword general:gaps_in 0
hyprctl keyword general:gaps_out 0

# Remove borders
hyprctl keyword general:border_size 0

# Optional: Disable rounding
hyprctl keyword decoration:rounding 0

notify-send "Hyprland" "Focus mode activated" -t 2000
