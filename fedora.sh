#!/bin/bash
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
browser="🌐"
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

echo "=== ${rocket} Section: Installing Dependencies ==="
# Define the list of packages to install
PACKAGES=(
    'awesome'
    'dmenu'
    'network-manager-applet'
    'rofi'
    'firefox'
    'kitty'
    'alacritty'
    'lsd'
    'pasystray' 
    'volumeicon'
    'redshift'
    'i3lock'
    'thunar'
    'flameshot'
    'lxappearance' 
    'nitrogen'
    'variety'
    'neovim'
    'vim'
    'bat'
    'obs-studio'
    'nitrogen'
    'lxappearance'
    'make'
    'cmake'
    'rust'
    'discord'
    'htop'
    'neofetch'
    'i3lock'
    'zsh'
    'curl'
    'zip'
    'unzip'
    'rar'
    'unrar'
    'gnome-characters'
    'git'
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
)

# Install packages using a single dnf command
sudo dnf install -y "${PACKAGES[@]}"

# Fonts
echo "=== ${rocket} Section: Installing fonts ==="
sudo dnf install -y libreoffice-opensymbol-fonts terminus-font google-noto-fonts-common
sudo fc-cache -v

# Picom animation
echo "=== ${motion} Section: Animation ==="
git clone https://github.com/jonaburg/picom.git
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
rm -rf picom

# Brave browser
echo "=== ${browser} Section: Brave Browser ==="
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc
sudo dnf install -y brave-browser-beta

# Icons Pack
echo "=== ${icons} Section: Icon Pack ==="
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme
chmod +x install.sh
sudo ./install.sh
cd ..
rm -rf Tela-circle-icon-theme

# Copy files to $HOME
echo "=== ${files_and_folders} Section: Copying files to $HOME ==="
# Destination directory
destination="$HOME/.config"

# Check if the destination directory exists, create it if not
if [ ! -d "$destination" ]; then
    mkdir -p "$destination"
fi

# Copy all folders and files from .config to $HOME/.config
cp -R -n "$HOME/.config"/* "$destination" >/dev/null 2>&1

# Check if any files/folders were copied
if [ $? -eq 0 ]; then
    echo "${done} Files and folders copied to $destination successfully."
else
    echo "${error} Files and folders copied to $destination failed."
fi

echo "=== ${reboot} Section: Reboot System ==="
echo "${reboot} Do you want to reboot your system? (Enter 'yes' or 'no')"
read -r choice

choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]' | xargs) # Convert to lowercase and remove leading/trailing whitespace

if [[ "$choice" == "yes" || "$choice" == "y" ]]; then
    echo -e "\n${reboot} Rebooting the system..."
    sleep 3
    reboot
elif [[ "$choice" == "no" || "$choice" == "n" ]]; then
    echo -e "\n${ok} No reboot requested. Exiting..."
else
    echo -e "\n${error} Invalid choice. No reboot requested. Exiting..."
fi
