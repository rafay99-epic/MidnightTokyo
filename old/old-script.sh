# # Emojis
# rocket="🚀"
# motion="🏃"
# done="✅"
# warning="⚠️"
# error="❌"
# browser="🌐"
# icons="🎆"
# files_and_folders="📁"
# install_application="📥"
# reboot="🔁"
# ok="👌"

# # Script should be run as a user not as root
# echo "=== ${rocket} Section: Running as a user ==="
# if [ $(id -u) -eq 0 ]; then
#     echo "${warning} Don't use sudo to run this script. Exiting.."
#     exit 1
# else
#     echo "${done} Script is being run as a user."
# fi

# echo "=== ${rocket} Section: Fedora System Check ==="
# # Check if Fedora package manager is being used
# if [ -n "$(command -v dnf)" ]; then
#     echo "${done} Fedora detected! Proceed with the rest of the script."
#     # Your additional commands or actions can go here
# else
#     echo "${error} This script is only for Fedora. Exiting.."
#     exit 1
# fi

# # Update your System: 
# echo "=== ${rocket} Section: Updating System ==="
# sudo dnf update -y


# echo "=== ${rocket} Section: Installing Dependencies ==="
# PKG=(
#     'awesome'
#     'dmenu'
#     'network-manager-applet'
#     'rofi'
#     'firefox'
#     'kityy'
#     'alacritty'
#     'lsd'
#     'pasystray' 
#     'volumeicon'
#     'redshift'
#     'i3lock'
#     'thunar'
#     'flameshot'
#     'lxappearance' 
#     'nitrogen'
#     'variety'
#     'neovim'
#     'vim'
#     'bat'
#     'obs-studio'
#     'nitrogen'
#     'lxappearance'
#     'make'
#     'cmake'
#     'rust'
#     'discord'
#     'htop'
#     'neofetch'
#     'zsh'
#     'curl'
#     'zip'
#     'unzip'
#     'rar'
#     'unrar'
#     'gnome-characters'
#     'git'
#     'ninja-build'
#     'gcc'
#     'gcc-c++'
#     'arandr'
#     'xrandr'
#     'dbus-devel'   
#     'libconfig-devel' 
#     'libdrm-devel' 
#     'libev-devel' 
#     'libX11-devel' 
#     'libX11-xcb' 
#     'libXext-devel' 
#     'libxcb-devel' 
#     'libGL-devel' 
#     'libEGL-devel' 
#     'meson' 
#     'pcre2-devel' 
#     'pixman-devel' 
#     'uthash-devel' 
#     'xcb-util-image-devel' 
#     'xcb-util-renderutil-devel' 
#     'xorg-x11-proto-devel'
#     'avr-gcc'
# )
# for PKG in "${PKG[@]}"; do
#     echo "=== ${install_application} Installing: ${PKG} ==="
#     sudo dnf install "$PKG" -y
# done

# # Fonts:
# echo "=== ${rocket} Section: Installing fonts ==="
# sudo dnf install libreoffice-opensymbol-fonts terminus-font google-noto-fonts-common -y
# sudo fc-cache -v

# # Picom animation:
# echo "=== ${motion} Section: Animation ==="
# git clone https://github.com/jonaburg/picom.git
# cd picom
# meson --buildtype=release . build
# ninja -C build
# sudo ninja -C build install
# cd ../
# rm -rf picom

# # Brave browser:
# echo "=== ${browser} Section: Brave Browser ==="
# sudo dnf install dnf-plugins-core -y
# sudo dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo
# sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc
# sudo dnf install brave-browser-beta

# # Icons Pack: 
# echo "=== ${icons} Section: Icon Pack ==="
# git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
# cd Tela-circle-icon-theme
# chmod +x install.sh
# sudo ./install.sh
# cd ../
# rm -rf Tela-circle-icon-theme

# # Copy files to $HOME
# echo "=== ${files_and_folders} Section: Copying files to $HOME ==="
# cp -R .fonts .screenlayout .scripts .themes .zshrc .bashrc "$HOME"
# fc-cache -v

# echo "=== ${files_and_folders} Section: Copying files to ${destination} ==="
# # Destination directory
# destination="$HOME/.config"

# # Check if the destination directory exists, create it if not
# if [ ! -d "$destination" ]; then
#     mkdir -p "$destination"
# fi

# # Copy all folders and files from .config to $HOME/.config
# cp -R -n "$HOME/.config"/* "$destination" >/dev/null 2>&1

# # Check if any files/folders were copied
# if [ $? -eq 0 ]; then
#     echo "${done} Files and folders copied to ${destination} successfully."
# else
#     echo "${error} Files and folders copied to ${destination} failed."
# fi

# echo "=== ${reboot} Section: Reboot System ==="

# echo "${reboot} Do you want to reboot your system? (Enter 'yes' or 'no')"
# read -r choice

# choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]' | xargs) # Convert to lowercase and remove leading/trailing whitespace

# if [[ "$choice" == "yes" || "$choice" == "y" ]]; then
#   echo -e "\n${reboot} Rebooting the system..."
#   sleep 3
#   reboot
# elif [[ "$choice" == "no" || "$choice" == "n" ]]; then
#   echo -e "\n${ok} No reboot requested. Exiting..."
# else
#   echo -e "\n${error} Invalid choice. No reboot requested. Exiting..."
# fi
