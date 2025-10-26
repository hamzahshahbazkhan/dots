
---

# Quick Commands Cheat Sheet – Arch + Hyprland Setup

## 🖥 System Info

```
uname -r              # Kernel version
arch                  # Architecture
hostnamectl           # Full system info
fastfetch             # OS, CPU, GPU, uptime
```

## 🖥 CPU & Memory

```
btop                  # Interactive CPU/RAM/disk/network
free -h               # Memory usage
uptime                # Load averages
```

## 🎮 GPU

```
nvidia-smi            # NVIDIA GPU status
prime-run glxinfo | grep "OpenGL renderer" # Check renderer
prime-run app          # Run app on NVIDIA GPU
glxinfo | grep "OpenGL renderer" # Intel GPU info
```

## 💾 Storage

```
lsblk                 # List disks
df -h                 # Disk usage
btrfs filesystem df / # BTRFS usage
udisksctl status      # Mounted volumes
ntfs-3g /dev/sdXY /mnt # Mount NTFS
```

## 🌐 Networking

```
nmcli dev status      # Network status
nm-applet             # GUI network tray
blueman-manager       # Bluetooth GUI
bluetoothctl          # CLI Bluetooth
ping google.com       # Test internet
```

## 🔊 Audio

```
wpctl status          # PipeWire status
pavucontrol           # GUI volume mixer
pulsemixer --list-sinks
pamixer --get-volume
pamixer --increase 5
pamixer --toggle-mute
```

## ⚡ Power & Battery

```
tlp-stat
sudo powertop
upower -i /org/freedesktop/UPower/devices/battery_BAT0
```

## 📂 File Management

```
ranger
lf
yazi
bat file.txt
fd pattern /path
rg pattern
fzf
z <dir>  # zoxide
```

## 🎬 Media & PDFs

```
mpv video.mp4
vlc video.mp4
imv image.png
gimp image.png
zathura file.pdf
```

**Zathura Tips**

```
:set recolor          # Toggle dark mode
```

## 🖼 Wayland / Hyprland

```
hyprctl dispatch workspace 1
hyprctl dispatch workspace 2
hyprctl dispatch workspace 3
hyprshot -m window
hyprshot -m output
hyprshot -m region
hyprpaper
hyprsunset
```

**Workspace Startup Script**

```
hyprctl dispatch workspace 1; kitty &
sleep 1
hyprctl dispatch workspace 2; firefox &
sleep 1
hyprctl dispatch workspace 3; code &
```

## 🛡 Security / Backup

```
timeshift
timeshift-autosnap
sudo systemctl status firewalld
```

## 🔤 Fonts & Themes

```
lxappearance
gcolor3
```

## 📝 Scripts / Productivity

**DuckDuckGo search**

```
query=$(echo "" | fzf --prompt="Search DuckDuckGo: ")
xdg-open "https://duckduckgo.com/?q=$query"
```

**Floating Notepad**

```
kitty --name floating_note
```

## ⚙ Optional / Nice-to-Have Tools

```
htop, glances, intel-gpu-tools
speedtest-cli, iftop
alsamixer
ncdu, tree
tldr, glow
newsboat
grim, slurp, swappy
```

---
