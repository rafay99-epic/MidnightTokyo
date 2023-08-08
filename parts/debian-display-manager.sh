#!/bin/bash

clear


echo "

        ███╗   ███╗██╗██████╗ ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗  ████████╗ ██████╗ ██╗  ██╗██╗   ██╗ ██████╗ 
        ████╗ ████║██║██╔══██╗████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝  ╚══██╔══╝██╔═══██╗██║ ██╔╝╚██╗ ██╔╝██╔═══██╗
        ██╔████╔██║██║██║  ██║██╔██╗ ██║██║██║  ███╗███████║   ██║        ██║   ██║   ██║█████╔╝  ╚████╔╝ ██║   ██║
        ██║╚██╔╝██║██║██║  ██║██║╚██╗██║██║██║   ██║██╔══██║   ██║        ██║   ██║   ██║██╔═██╗   ╚██╔╝  ██║   ██║
        ██║ ╚═╝ ██║██║██████╔╝██║ ╚████║██║╚██████╔╝██║  ██║   ██║        ██║   ╚██████╔╝██║  ██╗   ██║   ╚██████╔╝
        ╚═╝     ╚═╝╚═╝╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝                

                                            Debian Xorg-Session for MidNight Tokyo
"

# Function to check if a package is installed
is_installed() {
    local package_name=$1
    if dpkg -l | grep -q "^ii  $package_name"; then
        return 0 # Package is installed
    else
        return 1 # Package is not installed
    fi
}

# Function to install Xorg
install_xorg() {
    if is_installed xserver-xorg; then
        echo "✅ Xorg is already installed."
    else
        echo "🖥️ Installing Xorg..."
        sudo apt-get install xserver-xorg xinit -y
        echo "✅ Xorg installation complete."
    fi
}

# Function to install a display manager
install_display_manager() {
    local dm_name=$1

    if is_installed $dm_name; then
        echo "✅ $dm_name is already installed."
    else
        if [[ $dm_name == "lightdm" ]]; then
            echo "📺 Installing LightDM..."
            sudo apt-get install lightdm -y
            sudo systemctl enable lightdm
            sudo systemctl start lightdm
            echo "✅ LightDM installation complete."
        elif [[ $dm_name == "gdm3" ]]; then
            echo "📺 Installing GDM3..."
            sudo apt-get install gdm3 -y
            sudo systemctl enable gdm3
            sudo systemctl start gdm3
            echo "✅ GDM3 installation complete."
        elif [[ $dm_name == "sddm" ]]; then
            echo "📺 Installing SDDM..."
            sudo apt-get install sddm -y
            sudo systemctl enable sddm
            sudo systemctl start sddm
            echo "✅ SDDM installation complete."
        else
            echo "❌ Invalid display manager choice: $dm_name"
            exit 1
        fi
    fi
}

# Main menu
echo "👋 Welcome to the Display Manager Installer!"
echo "Choose a display manager to install:"
echo "1. LightDM"
echo "2. GDM3"
echo "3. SDDM"

read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        install_xorg
        install_display_manager "lightdm"
        ;;
    2)
        install_xorg
        install_display_manager "gdm3"
        ;;
    3)
        install_xorg
        install_display_manager "sddm"
        ;;
    *)
        echo "❌ Invalid choice. Exiting..."
        ;;
esac