#!/bin/bash

# Launch apps with workspace assignment
hyprctl dispatch exec "[workspace 1 silent] firefox"
hyprctl dispatch exec "[workspace 2 silent] ghostty" 
hyprctl dispatch exec "[workspace 4 silent] obsidian"

# Switch to workspace 1 at the end
hyprctl dispatch workspace 1

