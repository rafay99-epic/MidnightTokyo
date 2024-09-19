#!/bin/bash

# Get battery capacity
CAPACITY=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')

# Get battery status
STATUS=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')

# Check if battery is charging
if [ "$STATUS" == "charging" ]; then
  CHARGING="yes"
  COLOR="\033[0;32m" # Green color
  EMOJI_BATTERY="🔌" # Plug emoji
else
  CHARGING="no"
  COLOR="\033[0;31m" # Red color
  EMOJI_BATTERY="🔋" # Battery emoji
fi

# Get uptime
UPTIME=$(uptime -p)
EMOJI_UPTIME="⏱️" # Stopwatch emoji

# Print output
NC="\033[0m" # No color
echo -e "${EMOJI_BATTERY}  Battery capacity: ${COLOR}$CAPACITY${NC}"
echo -e "${EMOJI_BATTERY}  Battery status: ${COLOR}$STATUS${NC}"
echo -e "${EMOJI_BATTERY}  Battery charging: ${COLOR}$CHARGING${NC}"
echo -e "${EMOJI_UPTIME}  System uptime: ${COLOR}$UPTIME${NC} "