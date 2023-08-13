#!/bin/bash

clear

# Banner
echo "

        ███╗   ███╗██╗██████╗ ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗  ████████╗ ██████╗ ██╗  ██╗██╗   ██╗ ██████╗ 
        ████╗ ████║██║██╔══██╗████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝  ╚══██╔══╝██╔═══██╗██║ ██╔╝╚██╗ ██╔╝██╔═══██╗
        ██╔████╔██║██║██║  ██║██╔██╗ ██║██║██║  ███╗███████║   ██║        ██║   ██║   ██║█████╔╝  ╚████╔╝ ██║   ██║
        ██║╚██╔╝██║██║██║  ██║██║╚██╗██║██║██║   ██║██╔══██║   ██║        ██║   ██║   ██║██╔═██╗   ╚██╔╝  ██║   ██║
        ██║ ╚═╝ ██║██║██████╔╝██║ ╚████║██║╚██████╔╝██║  ██║   ██║        ██║   ╚██████╔╝██║  ██╗   ██║   ╚██████╔╝
        ╚═╝     ╚═╝╚═╝╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝                
                                            
                                            Author Setup Script
"
# Emojis
rocket="🚀"
done="✅"
warning="⚠️"
error="❌"
browser="🌐"
files_and_folders="📁"
prompte="🔥"


# Script should be run as a user not as root
echo "=== ${rocket} Section: Running as a user ==="
if [ "$(id -u)" -eq 0 ]; then
    echo "${warning} Don't use sudo to run this script. Exiting.."
    exit 1
else
    echo "${done} Script is being run as a user."
fi


echo "=== ${rocket} Section: Fedora System Check ==="
# Check if Fedora package manager is being used
if ! command -v dnf &> /dev/null; then
    echo "${error} This script is only for Fedora. Exiting.."
    exit 1
fi

echo "${done} Fedora detected! Proceeding with the rest of the script."

# Update your System
echo "=== ${rocket} Section: Updating System ==="
sudo dnf update -y


echo "=== ${rocket} Section: Installing Applications ==="
# Define the list of packages to install
PACKAGES=(

    'firefox'
    'vim'
    'bat'
    'obs-studio'
    'vlc'
    'rust'
    'discord'
    'htop'
    'neofetch'
    'curl'
    'zip'
    'unzip'
    'unrar'
    'git'
    'wget'
    'tree'
    'flatpak'
    'xrandr'
    'hugo'
    'trash-cli'
)

# Install packages using a single dnf command
sudo dnf install -y "${PACKAGES[@]}"

