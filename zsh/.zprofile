
# Launch Hyprland only if logging into tty1
if [ "$(tty)" = "/dev/tty1" ]; then
   start-hyprland 
fi
