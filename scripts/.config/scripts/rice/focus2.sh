#!/bin/bash
# Focus mode 2 - Maximum clarity, no distractions

hyprctl keyword decoration:inactive_opacity 0.75
hyprctl keyword decoration:active_opacity 0.75

# Remove all gaps
hyprctl keyword general:gaps_in 0
hyprctl keyword general:gaps_out 0

# Remove borders
hyprctl keyword general:border_size 0

# Optional: Disable rounding
hyprctl keyword decoration:rounding 0

notify-send "Hyprland" "Focus2 mode activated" -t 2000
