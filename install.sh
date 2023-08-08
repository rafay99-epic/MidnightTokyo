#!/bin/bash

clear

echo "

        ███╗   ███╗██╗██████╗ ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗  ████████╗ ██████╗ ██╗  ██╗██╗   ██╗ ██████╗ 
        ████╗ ████║██║██╔══██╗████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝  ╚══██╔══╝██╔═══██╗██║ ██╔╝╚██╗ ██╔╝██╔═══██╗
        ██╔████╔██║██║██║  ██║██╔██╗ ██║██║██║  ███╗███████║   ██║        ██║   ██║   ██║█████╔╝  ╚████╔╝ ██║   ██║
        ██║╚██╔╝██║██║██║  ██║██║╚██╗██║██║██║   ██║██╔══██║   ██║        ██║   ██║   ██║██╔═██╗   ╚██╔╝  ██║   ██║
        ██║ ╚═╝ ██║██║██████╔╝██║ ╚████║██║╚██████╔╝██║  ██║   ██║        ██║   ╚██████╔╝██║  ██╗   ██║   ╚██████╔╝
        ╚═╝     ╚═╝╚═╝╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝                

                                            Install script for MidNight Tokyo
"

# Function to display an error message and exit
show_error() {
    echo "❌ Error: $1"
    exit 1
}

# Check if script is run with sudo
if [ "$EUID" -eq 0 ]; then
    show_error "Please do not run this script with sudo."
fi

# Check if Debian package manager is installed
if command -v apt-get &> /dev/null; then
    echo "✅ Debian package manager (apt-get) is installed."
    clear
    ./debian.sh
fi

# Check if Fedora package manager is installed
if command -v dnf &> /dev/null; then
    echo "✅ Fedora package manager (dnf) is installed."
    clear
    ./fedora.sh
fi

# Check if Arch package manager is installed
if command -v pacman &> /dev/null; then
    echo "✅ Arch package manager (pacman) is installed."
    show_error "Arch is not supported yet. Sorry :("
fi

# If no package manager is detected
if ! command -v apt-get &> /dev/null && ! command -v dnf &> /dev/null && ! command -v pacman &> /dev/null; then
    show_error "No supported package manager detected."
fi
