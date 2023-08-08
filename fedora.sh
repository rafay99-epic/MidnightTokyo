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
"
# Emojis
rocket="🚀"
motion="🏃"
done="✅"
warning="⚠️"
error="❌"
icons="🎆"
files_and_folders="📁"
reboot="🔁"
ok="👌"

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

echo "=== ${rocket} Section: Installing RPM Fusion ==="
# sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Free rmfusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# Non Free rmfusion
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Enabling AppStream
sudo dnf group update core -y

# Microsoft Visual Studio Code
echo "=== ${rocket} Section: Microsoft Visual Studio Code ==="
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update

# Brave Browser
echo "=== ${browser} Section: Brave Browser ==="
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc

# Update your System
echo "=== ${rocket} Section: Updating System ==="
sudo dnf update -y


echo "=== ${rocket} Section: Installing Dependencies ==="
# Define the list of packages to install
PACKAGES=(
    'awesome'
    'dmenu'
    'network-manager-applet'
    'rofi'
    'kitty'
    'pasystray' 
    'volumeicon'
    'i3lock'
    'thunar'
    'flameshot'
    'lxappearance' 
    'nitrogen'
    'variety'
    'vim'
    'bat'
    'make'
    'cmake'
    'rust'
    'i3lock'
    'ninja-build'
    'gcc'
    'gcc-c++'
    'arandr'
    'xrandr'
    'dbus-devel'   
    'libconfig-devel' 
    'libdrm-devel' 
    'libev-devel' 
    'libX11-devel' 
    'libX11-xcb' 
    'libXext-devel' 
    'libxcb-devel' 
    'libGL-devel' 
    'libEGL-devel' 
    'meson' 
    'pcre2-devel' 
    'pixman-devel' 
    'uthash-devel' 
    'xcb-util-image-devel' 
    'xcb-util-renderutil-devel' 
    'xorg-x11-proto-devel'
    'avr-gcc'
    'pcre-devel'
    'xss-lock'
    'blueman'
    'alsa-tools'
    'inkscape'
    'xorg-x11-apps'
    'i3lock-fancy'
    'gnome-characters'
    'fish'
    'kitty'
    'alacritty'
    'lsd'
    'neovim'
    'arandr'
    'trash-cli'
    'tldr'
    'zsh'
    'brave-browser'
    'code'
)
# Install packages using a single dnf command
sudo dnf install -y "${PACKAGES[@]}"

# Fonts
echo "=== ${rocket} Section: Installing fonts ==="
sudo dnf install -y libreoffice-opensymbol-fonts terminus-fonts google-noto-fonts-common
sudo fc-cache -v

# Picom animation
echo "=== ${motion} Section: Animation ==="
cd parts
chmod +x picom-animation.sh
./picom-animation.sh
cd ..

# Icons
echo "=== ${icons} Section: Icons ==="
cd parts
chmod +x icons.sh
./icons.sh
cd ..

# Promote
echo "=== ${rocket} Section: Promote ==="
cd parts
chmod +x promote.sh
./promote.sh
cd ..


# Copy files to $HOME
echo "=== ${files_and_folders} Section: Copying files to $HOME ==="
cd parts
chmod +x move-file.sh
./move-file.sh
cd ..


#Defautl Shell
echo "=== ${rocket} Section: Default Shell ==="
cd parts
chmod +x default-shell.sh
./default-shell.sh
cd ..

# Flat Pak Apps
echo "=== ${rocket} Section: Flatpak Apps ==="
cd parts
chmod +x flatpak-apps.sh
./flatpak-apps.sh
cd ..

# other apps
echo "=== ${rocket} Section: Other Apps ==="
cd parts
./other-apps.sh
cd ..

# Author Applications
echo "Welcome to the Author's Setup Script! 🎉"

read -rp "Do you want to install and configure the author's files? (y/n): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo "✅ Starting installation..."
    
    # Run the author-setup script and capture the exit code
    ./author-setup.sh
    exit_code=$?
    
    if [[ $exit_code -eq 0 ]]; then
        echo "✅ Installation and configuration complete!"
    else
        echo "❌ Installation failed."
        exit $exit_code
    fi
else
    echo "⚠️ Installation cancelled by user."
fi

echo "=== ${rocket} Section: Installing Display Manager ==="
cd parts
chmod +x fedora-display-manager.sh
./fedora-display-manager.sh
cd ..


echo "=== ${rocket} Section: Reboot System ==="
cd parts
chmod +x reboot.sh
./reboot.sh
cd ..