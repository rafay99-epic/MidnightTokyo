#!/bin/bash

echo "

        ███╗   ███╗██╗██████╗ ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗  ████████╗ ██████╗ ██╗  ██╗██╗   ██╗ ██████╗ 
        ████╗ ████║██║██╔══██╗████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝  ╚══██╔══╝██╔═══██╗██║ ██╔╝╚██╗ ██╔╝██╔═══██╗
        ██╔████╔██║██║██║  ██║██╔██╗ ██║██║██║  ███╗███████║   ██║        ██║   ██║   ██║█████╔╝  ╚████╔╝ ██║   ██║
        ██║╚██╔╝██║██║██║  ██║██║╚██╗██║██║██║   ██║██╔══██║   ██║        ██║   ██║   ██║██╔═██╗   ╚██╔╝  ██║   ██║
        ██║ ╚═╝ ██║██║██████╔╝██║ ╚████║██║╚██████╔╝██║  ██║   ██║        ██║   ╚██████╔╝██║  ██╗   ██║   ╚██████╔╝
        ╚═╝     ╚═╝╚═╝╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝                
                                            
                                            Debain Setup Script
"


# Updating System 
sudo apt-get update -y

# installing dependiences
echo -ne "
-------------------------------------------------------------------------
                --- Dependicies Applications---
    
    Applications:
    1.  git
    2.  curl
    3.  wget
    4.  vim
    5.  nano
    6.  python3
    7.  python3-pip
    8.  python3-venv
    9.  build-essential
    10. libreadline-gplv2-dev 
    11. libncursesw5-dev
    12. cmake
    13. apt-transport-https
    14. libvirt-clients
    15. libvirt-daemon-system
    16. pkg-config 
    17. libfreetype6-dev
    18. libfontconfig1-dev 
    19. libxcb-xfixes0-dev 
    20. libxkbcommon-dev 
    21. zlib1g-dev
    22. libncurses5-dev 
    23. libgdbm-dev 
    24. libnss3-dev 
    25. libssl-dev 
    26. libreadline-dev
    27. libffi-dev
    28. libsqlite3-dev 
    29. libbz2-dev
    30. Flatpak
    31. Pascall
    32. nala

-------------------------------------------------------------------------
"
sudo apt-get install git wget curl vim nano neovim -y
sudo apt-get install python3 -y 
sudo apt-get install python3-pip -y
sudo apt-get install python3-venv -y
sudo apt-get install build-essential libreadline-gplv2-dev libncursesw5-dev -y
sudo apt-get install cmake -y
sudo apt-get install libvirt-clients libvirt-daemon-system gdebi-core apt-transport-https -y 
sudo apt-get install flatpak -y
sudo apt-get install pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev -y
sudo apt-get install procps file -y 
sudo apt-get install python3-toml -y
sudo apt-get install nala -y 
sudo apt-get install  zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev -y
sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"


# Repo for Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Repo for Visual Studio code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Flatpak Repot
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# Installing Applictions
PKGS=(
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
        'code'
        'npm'
        'nodejs'
        'hugo'
        'obs-studio'
        'vim' 
        'bat'
        'lxappearance'
        'neovim'        
        )
        for PKG in "${PKGS[@]}"; do
            echo "
-------------------------------------------------------------------------
          INSTALLING: "${PKG}"
-------------------------------------------------------------------------
            "  
            sudo nala install "$PKG" -y
            
        done

echo -ne "
-------------------------------------------------------------------------
           --- Installing Fm6000 Program   ---
-------------------------------------------------------------------------
"
sh -c "$(curl https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/install.sh)" 


echo "
---------------------------------------------
    Install Starship Promote
---------------------------------------------
"
curl -sS https://starship.rs/install.sh | sh


# Xorg Server
sudo nala install  xorg build-dep xinit xserver-xorg-core xserver-xorg -y 

# Aweosme Windwo Manager
sudo nala install awesome -y 

# Network Manager
sudo nala install network-manager-applet -y 
# Application finder
sudo nala install rofi dmenu -y 
# Terminal
sudo nala install kitty fish zsh -y 
# Lock Screen
sudo nala install i3clock i3clock-fancy -y 
# File Manager & Apperance
sudo nala install thunar lxappearance bat -y 
# Keyboard backlight
sudo nala install xbacklight  -y
# Core tools
sudo nala install make cmake -y
sudo nala install gcc gcc++ meson  -y 
# Bluetooth & External Screen
sudo nala install arandr xrandr blueman  -y

# Dependiences for Picom
sudo nala install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev -y 
sudo nala install libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev -y 
sudo nala install libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  -y
sudo nala install libevdev-dev uthash-dev libev-dev libx11-xcb-dev -y 

# Flamshort
sudo nala install flameshot -y
# Volum icons for awesome
sudo nala install volumeicon-alsa -y
# Pulse Audio & Icons
sudo nala install pulseaudio pulseaudio-utils -y 
sudo nala install pavucontrol -y
sudo nala install pasystray alsa-tools -y 
# Variety & Wallpapers
sudo nala install variety nitrogen -y
# Mouse Guestures
sudo nala install wmctrl xdotool  libinput-tools -y  
sudo libinput-gestures-setup autostart start

# Install Picom Jonaburg Version
git clone https://github.com/jonaburg/picom.git
cd picom
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
rm -rf picom

# Placing Files
cd .config/
cp -R -n awesome gtk-1.0 gtk-2.0 gtk-3.0 gtk-4.0 rofi picom "$destination" >/dev/null 2>&1
cd ..
# Copying  Pictures to $HOME/Pictures
cp -R -n Toky-Wallpapers  "$pictures" >/dev/null 2>&1

cp -R -n .themes  .fonts  "$HOME" >/dev/null 2>&1

cp -R -n .bashrc .zshrc .scripts .screenlayout  "$HOME" >/dev/null 2>&1

cd .config/
cp -R -n alacritty fish kitty neofetch nvim bash htop ranger zsh starship.toml "$HOME"/.config/ >/dev/null 2>&1
cd ..

# Check if any files/folders were copied
if [ $? -eq 0 ]; then
    echo "${done} Files and folders copied to $destination successfully."
else
    echo "${error} Files and folders copied to $destination failed."
fi


