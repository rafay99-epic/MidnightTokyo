#!/bin/bash

clear

echo "

        ███╗   ███╗██╗██████╗ ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗  ████████╗ ██████╗ ██╗  ██╗██╗   ██╗ ██████╗ 
        ████╗ ████║██║██╔══██╗████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝  ╚══██╔══╝██╔═══██╗██║ ██╔╝╚██╗ ██╔╝██╔═══██╗
        ██╔████╔██║██║██║  ██║██╔██╗ ██║██║██║  ███╗███████║   ██║        ██║   ██║   ██║█████╔╝  ╚████╔╝ ██║   ██║
        ██║╚██╔╝██║██║██║  ██║██║╚██╗██║██║██║   ██║██╔══██║   ██║        ██║   ██║   ██║██╔═██╗   ╚██╔╝  ██║   ██║
        ██║ ╚═╝ ██║██║██████╔╝██║ ╚████║██║╚██████╔╝██║  ██║   ██║        ██║   ╚██████╔╝██║  ██╗   ██║   ╚██████╔╝
        ╚═╝     ╚═╝╚═╝╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝                
                                            
                                            Debain Setup Script
"

# 🔄 Updating system
echo "🔁 Updating system..."
sudo apt-get update -y

# 🦁 Adding Repo for Brave Browser
echo "🦁 Adding Repo for Brave Browser..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# ⚙️ Adding Repo for Visual Studio Code
echo "⚙️ Adding Repo for Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg

# 🔄 Updating repositories
echo "🔁 Updating repositories..."
sudo apt-get update -y 

# 🛠️ Installing applications
echo "🛠️ Installing applications..."
sudo apt-get install code brave-browser -y 

# 📋 List of Dependencies
dependencies=("git" "curl" "wget" "vim" "nano" "neovim" "python3" "python3-pip" "python3-venv"
              "build-essential" "libreadline-gplv2-dev" "libncursesw5-dev" "cmake"
              "libvirt-clients" "libvirt-daemon-system" "gdebi-core" "apt-transport-https"
              "flatpak" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev"
              "libxcb-xfixes0-dev" "libxkbcommon-dev" "procps" "file" "python3-toml"
              "nala" "inkscape" "x11-apps" "zlib1g-dev" "libncurses5-dev" "libgdbm-dev"
              "libnss3-dev" "libssl-dev" "libreadline-dev" "libffi-dev" "libsqlite3-dev" "libbz2-dev")

# 🔧 Installing Dependencies
echo -e "-------------------------------------------------------------------------\n--- 📦 Installing Dependencies ---\n"
for dependency in "${dependencies[@]}"; do
    echo "Installing $dependency..."
    sudo apt-get install "$dependency" -y
done

# 💻 Installing additional software using Nala
echo "💻 Installing additional software using Nala..."
sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"

# 🔄 Updating and installing VS Code using Nala
echo "🔄 Updating and installing VS Code using Nala..."
sudo nala update 
sudo nala install code 

echo -e "🚀 Installation and setup completed successfully!\n"

echo "🔄 Install Flatpak:"
# Flatpak Repot
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# List of packages to install
PKGS=(
    # General Utilities
    'htop'
    'neofetch'
    'brave-browser'
    'fonts-mononoki'
    'fonts-powerline'
    'fonts-font-awesome'
    'openjdk-11-jdk'
    'qemu-kvm'
    'zsh'
    'libvirt-clients'
    'libvirt-daemon-system'
    'bridge-utils'
    'virtinst'
    'libvirt-daemon'
    'virt-manager'
    'npm'
    'nodejs'
    'hugo'
    'obs-studio'
    'vim'
    'bat'
    'lxappearance'
    'neovim'
    'fakeroot'
    'devscripts'
    'fdupes'
    
    # Xorg and Window Manager
    'xorg'
    'xinit'
    'xserver-xorg-core'
    'awesome'
    
    # Network Manager and Tools
    'network-manager-applet'
    'rofi'
    'dmenu'
    
    # Terminals and Utilities
    'kitty'
    'fish'
    'zsh'
    'i3lock'
    'i3lock-fancy'
    'thunar'
    'lxappearance'
    'bat'
    'xbacklight'
    'make'
    'cmake'
    'gcc'
    'g++'
    'meson'
    'arandr'
    'xrandr'
    'blueman'
    
    # Dependencies for Picom
    'libxext-dev'
    'libxcb1-dev'
    'libxcb-damage0-dev'
    'libxcb-xfixes0-dev'
    'libxcb-shape0-dev'
    'libxcb-render-util0-dev'
    'libxcb-render0-dev'
    'libxcb-randr0-dev'
    'libxcb-composite0-dev'
    'libxcb-image0-dev'
    'libxcb-present-dev'
    'libxcb-xinerama0-dev'
    'libxcb-glx0-dev'
    'libpixman-1-dev'
    'libdbus-1-dev'
    'libconfig-dev'
    'libgl1-mesa-dev'
    'libpcre2-dev'
    'libevdev-dev'
    'uthash-dev'
    'libev-dev'
    'libx11-xcb-dev'
    'meson'
    'ninja-build'
    'libpcre3'
    'libpcre3-dev'
    
    # Network Manager and Tools
    'network-manager-gnome'
    'suckless-tools'
    
    # Miscellaneous Tools
    'flameshot'
    'volumeicon-alsa'
    'pulseaudio'
    'pulseaudio-utils'
    'pavucontrol'
    'pasystray'
    'alsa-tools'
    'variety'
    'nitrogen'
    'wmctrl'
    'xdotool'
    'libinput-tools'
)

# Install packages with emojis
for PKG in "${PKGS[@]}"; do
    echo "
🚀 Installing: ${PKG} 🚀"
    sudo nala install "$PKG" -y
done



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


echo "
✨ All applications installed successfully! ✨"

echo -e "🚀 Installation and setup completed successfully!\n"


echo "=== ${rocket} Section: Reboot System ==="
cd parts
chmod +x reboot.sh
./reboot.sh
cd ..


