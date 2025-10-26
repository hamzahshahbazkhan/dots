#!/bin/bash

# Set environment variables needed for notifications in cron
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export DISPLAY=:0

# State files to track notification status
STATE_DIR="/tmp/battery_alerts"
mkdir -p "$STATE_DIR"
LOW_20_FILE="$STATE_DIR/low_20_notified"
LOW_5_FILE="$STATE_DIR/low_5_notified"

# Get battery capacity and status
CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

# Reset notification flags when charging (battery going up)
if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
    rm -f "$LOW_20_FILE" "$LOW_5_FILE"
    exit 0
fi

# Only check when discharging
if [ "$STATUS" = "Discharging" ]; then
    
    # Check for 5% threshold (most critical)
    if [ "$CAPACITY" -le 5 ] && [ ! -f "$LOW_5_FILE" ]; then
        notify-send -u critical "CRITICAL BATTERY" "Battery at ${CAPACITY}% - Device will shutdown soon!"
        touch "$LOW_5_FILE"
    
    # Check for 20% threshold (first warning)
    elif [ "$CAPACITY" -le 20 ] && [ ! -f "$LOW_20_FILE" ]; then
        notify-send -u critical "BATTERY LOW" "Battery at ${CAPACITY}% - Please charge soon"
        touch "$LOW_20_FILE"
    fi
fi

