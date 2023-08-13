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
    flatpak install flathub "$1" -y || show_error "Failed to install $1"
}

# Install Flatpak applications
install_flatpak io.github.shiftey.Desktop
install_flatpak md.obsidian.Obsidian
install_flatpak com.spotify.Client
install_flatpak io.github.mimbrero.WhatsAppDesktop
install_flatpak me.ppvan.psequel
install_flatpak com.getpostman.Postman
install_flatpak org.gnome.Boxes
install_flatpak com.github.tchx84.Flatseal
install_flatpak com.unity.UnityHub
install_flatpak org.jupyter.JupyterLab
install_flatpak io.qt.Designer
install_flatpak io.qt.QtCreator
install_flatpak com.bitwarden.desktop
install_flatpak com.mattjakeman.ExtensionManager
install_flatpak com.github.GradienceTeam.Gradience
install_flatpak com.mongodb.Compass
install_flatpak org.gabmus.hydrapaper
install_flatpak com.geekbench.Geekbench6

echo "✅ Flatpak applications installed successfully."
