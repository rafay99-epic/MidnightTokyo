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

                                            Check Xorg Session for MidNight Tokyo

"

#!/bin/bash

# Function to check if a package is installed
is_installed() {
    local package_name=$1
    if rpm -q $package_name &> /dev/null; then
        return 0 # Package is installed
    else
        return 1 # Package is not installed
    fi
}

# Function to install Xorg
install_xorg() {
    if is_installed xorg-x11-server-Xorg; then
        echo "✅ Xorg is already installed."
    else
        echo "🖥️ Installing Xorg..."
        sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit -y
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
            sudo dnf install lightdm lightdm-gtk -y
            sudo systemctl enable lightdm
            # sudo systemctl start lightdm
            echo "✅ LightDM installation complete."
        elif [[ $dm_name == "gdm" ]]; then
            echo "📺 Installing GDM..."
            sudo dnf install gdm -y
            sudo systemctl enable gdm
            # sudo systemctl start gdm
            echo "✅ GDM installation complete."
        elif [[ $dm_name == "sddm" ]]; then
            echo "📺 Installing SDDM..."
            sudo dnf install sddm -y
            sudo systemctl enable sddm
            # sudo systemctl start sddm
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
echo "2. GDM"
echo "3. SDDM"

read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        install_xorg
        install_display_manager "lightdm"
        ;;
    2)
        install_xorg
        install_display_manager "gdm"
        ;;
    3)
        install_xorg
        install_display_manager "sddm"
        ;;
    *)
        echo "❌ Invalid choice. Exiting..."
        ;;
esac
