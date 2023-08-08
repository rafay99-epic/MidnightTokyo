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
                                            
                                            Flatpak Setup Script
"

# Emojis
rocket="🚀"

echo "=== ${rocket} Section:  Flatpak Setup ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo



echo "=== ${rocket} Section: Installing Applications using Flatpak ==="
# Function to install a Flatpak application with error handling
install_flatpak() {
    sudo flatpak install flathub "$1" -y || show_error "Failed to install $1"
}

# Install Flatpak applications
install_flatpak com.google.AndroidStudio
install_flatpak io.github.shiftey.Desktop
install_flatpak md.obsidian.Obsidian
install_flatpak com.spotify.Client

echo "✅ Flatpak applications installed successfully."
