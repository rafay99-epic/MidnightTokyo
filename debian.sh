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
cross_mark="❌"
check_mark="✅"
gear="⚙️"



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

# Checking Nala in the Repository
echo "=== ${rocket} Section: Checking Nala in the Repository ==="

# 📋 List of Dependencies
dependencies=(
            # Ssytem Dependencies
              "build-essential" "libncursesw5-dev" "cmake" "libbz2-dev"
              "libvirt-clients" "libvirt-daemon-system" "gdebi-core" "apt-transport-https"
              "flatpak" "pkg-config" "libfreetype6-dev" "libfontconfig1-dev" 'fakeroot'
              "libxcb-xfixes0-dev" "libxkbcommon-dev" "procps" "file" "python3-toml"
              "inkscape"  "zlib1g-dev" "libncurses5-dev" "libgdbm-dev"
              "libnss3-dev" "libssl-dev" "libreadline-dev" "libffi-dev" "libsqlite3-dev" "flatpak"
              "devscripts" "fdupes" "make" "cmake" "gcc" "g++" "meson" "ninja-build" "wmctrl" "xdotool" "libinput-tools"
            # File Manager
               "thunar" "ranger"
            #  Terminal & Utilities
              "htop"  'zsh' 'bat' 'lxappearance' 'neofetch' 'fish' 'obs-studio' "git" "curl" "wget" "kitty" "fish" "lxappearance" "bat" "trash-cli" "lsd" "tree" 
              "unzip" "unrar"
            #  Font Manager 
              'fonts-mononoki' 'fonts-powerline' 'fonts-font-awesome'
            #   Coding & Programming Language
              'npm' 'nodejs' 'hugo'  'openjdk-11-jdk' "python3" "python3-pip" "python3-venv"
            # Editiors
               'code' 'neovim' "vim" "nano"
            #   Virtual Machine
              'qemu-kvm'  'libvirt-clients' 'libvirt-daemon-system' 'bridge-utils' 'virtinst' 'libvirt-daemon' 'virt-manager' 
            #   browsers
               "brave-browser" "firefox"
            # Xorg 
                "xorg" "xinit" "xserver-xorg-core" "x11-apps" "x11-xserver-utils"
            # Awesome WM
                "awesome"
                # Lock Screen
                "i3lock" "i3lock-fancy"
                # back Screen Light & Screen Setup
                "xbacklight"  "arandr"
                # Bluetooth
                "blueman"
                # Network Manager & Searching Applications
                "network-manager-gnome" "suckless-tools" "rofi"
                # Picom
                "libxext-dev" "libxcb1-dev" "libxcb-damage0-dev" "libxcb-xfixes0-dev" 
                "libxcb-shape0-dev" "libxcb-render-util0-dev" "libxcb-render0-dev" "libxcb-randr0-dev" 
                "libxcb-composite0-dev" "libxcb-image0-dev" "libxcb-present-dev" "libxcb-xinerama0-dev" 
                "libxcb-glx0-dev" "libpixman-1-dev" "libdbus-1-dev" "libconfig-dev" "libgl1-mesa-dev" 
                "libpcre2-dev" "libevdev-dev" "uthash-dev" "libev-dev" "libx11-xcb-dev"  "libpcre3" "libpcre3-dev"
                # Waalpaper
                "variety" "nitrogen" "flameshot"
                # Audio
                "volumeicon-alsa" "pulseaudio" "pulseaudio-utils" "pavucontrol"
                "alsa-tools" "alsa-utils" "alsa-oss" "alsa-base" "alsa-ucm-conf" "alsa-topology-conf" "alsa-ucm-conf" "pasystray" 
            )

# Check if nala is available in the repository
if apt-cache policy nala | grep -q "Installed: (none)"; then
    echo "$cross_mark Nala is not available in the repository."
    
    # Install applications using nala
    echo "$rocket Installing applications using nala..."
    for app in "${dependencies[@]}"; do
        echo "$gear Installing $app using nala..."
        sudo apt-get install "$app" -y
    done
else
    echo "$check_mark Nala is available in the repository. Installing nala..."
    sudo apt-get update
    sudo apt-get install nala -y 
    echo "$rocket Installing other applications using nala..."
    sudo nala install "${dependencies[@]}" -y
fi

echo "✨ All applications installed successfully! ✨"

# Installing Pacstall
echo "💻 Installing Pacstall: AUR for Debian"
cd parts
chmod +x pacstall-install.sh
./pacstall-install.sh
cd ..

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

echo "=== ${rocket} Section: Installing Display Manager ==="
cd parts
chmod +x debian-display-manager.sh
./debian-display-manager.sh
cd ..

echo "=== ${rocket} Section: Reboot System ==="
cd parts
chmod +x reboot.sh
./reboot.sh
cd ..