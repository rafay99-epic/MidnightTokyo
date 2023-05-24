#!/bin/bash

# Open kitty terminal and run battery script
kitty --name=battery --title=battery --hold -- bash -c "~/.scripts/battery.sh; read -p 'Press q to exit' -n 1; if [[ \$REPLY =~ ^[qQ]$ ]]; then exit 0; fi"

# Exit the script
exit 0
