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
    'fish'
    'zsh'
    'firefox'
    'kitty'
    'alacritty'
    'lsd'
    'neovim'
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
    'gnome-characters'
    'git'
    'wget'
    'tree'
    'flatpak'
    'arandr'
    'xrandr'
    'tldr'
    'hugo'
    'trash-cli'
    'cmatrix'
)

# Install packages using a single dnf command
sudo dnf install -y "${PACKAGES[@]}"

# Enabling Flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Flatpak Apps
sudo flatpak install flathub com.google.AndroidStudio -y
sudo flatpak install flathub io.github.shiftey.Desktop -y
sudo flatpak install flathub md.obsidian.Obsidian -y
sudo flatpak install flathub com.spotify.Client -y

# Installing VS CODE:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

# Brave browser
echo "=== ${browser} Section: Brave Browser ==="
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc
sudo dnf install -y brave-browser-beta

echo "=== ${prompte} Section: Starship Promote ==="
curl -sS https://starship.rs/install.sh | sh

echo "=== ${prompte} Section: Fm6000 ==="
sh -c "$(curl https://codeberg.org/anhsirk0/fetch-master-6000/raw/branch/main/install.sh)"


echo "=== ${files_and_folders} Section: Moving Files to $HOME/.config ==="
# Moving Files to the $HOME directory
cp -R -n .bashrc .zshrc .scripts .screenlayout  "$HOME" >/dev/null 2>&1

# Copying Files from .config to $HOME/.config 
cd .config/
cp -R -n alacritty fish kitty neofetch nvim bash htop ranger zsh starship.toml "$HOME"/.config/ >/dev/null 2>&1
cd ..

echo "=== ${rocket} Section: Anaconda Install ==="
wget  https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
chmod +x Anaconda3-2023.03-1-Linux-x86_64.sh
./Anaconda3-2023.03-1-Linux-x86_64.sh
