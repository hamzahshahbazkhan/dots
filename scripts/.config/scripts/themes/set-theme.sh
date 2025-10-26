
#!/bin/bash

THEMES_DIR="$HOME/.config/themes"
THEME_LINK="$THEMES_DIR/current"

if [ -z "$1" ]; then
    echo "Usage: set-theme <theme-name>"
    echo ""
    echo "Available themes:"
    ls -1 "$THEMES_DIR" 2>/dev/null | grep -v "current" | sed 's/^/  - /'
    [ -L "$THEME_LINK" ] && echo "" && echo "Current: $(basename $(readlink $THEME_LINK))"
    exit 1
fi

THEME="$1"
THEME_DIR="$THEMES_DIR/$THEME"

if [ ! -d "$THEME_DIR" ]; then
    echo "Error: Theme '$THEME' not found"
    exit 1
fi

# Update the symlink
rm -f "$THEME_LINK"
ln -sf "$THEME_DIR" "$THEME_LINK"

echo "✓ Switched to: $THEME"
echo ""
echo "Reloading services..."

# Reload Hyprland

# Reload Waybar
# if pgrep -x waybar > /dev/null; then
#     pkill -SIGUSR2 waybar 2>/dev/null && echo "  ✓ Waybar reloaded" || {
#         killall waybar 2>/dev/null
#         waybar &>/dev/null &
#         echo "  ✓ Waybar restarted"
#     }
# fi

# Reload Mako
if pgrep -x mako > /dev/null; then
    makoctl reload &>/dev/null && echo "  ✓ Mako reloaded"
fi

# Reload tmux if it's running
# if command -v tmux &> /dev/null && tmux info &> /dev/null 2>&1; then
    tmux source-file ~/.tmux.conf
#     echo "  ✓ Tmux reloaded"
# fi

echo ""
echo "Restart manually for full effect:"
echo "  - Ghostty: close and reopen"
echo "  - Neovim: close and reopen"
echo "  - Rofi: applies on next launch"

