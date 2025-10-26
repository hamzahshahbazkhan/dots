#!/bin/bash
# Full rice mode - Transparency, gaps, and borders

# Set opacity to 0.75 for both active and inactive windows
hyprctl keyword decoration:inactive_opacity 0.75
hyprctl keyword decoration:active_opacity 0.75

# Set gaps
hyprctl keyword general:gaps_in 5
hyprctl keyword general:gaps_out 10

# Add border
hyprctl keyword general:border_size 2

# Optional: Keep rounding disabled (or enable with small radius if desired)
hyprctl keyword decoration:rounding 0

notify-send "Hyprland" "Full rice mode activated" -t 2000
