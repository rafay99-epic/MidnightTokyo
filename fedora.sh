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
function check_success() {
    if [ $? -eq 0 ]; then
        echo "✅ Successfully installed $1"
    else
        echo "❌ Failed to install $1"
        exit 1
    fi
}



install_flatpak() {
    flatpak install flathub "$1" -y || exit 1;  echo "Failed to install Flatpak App"
}


# Emojis
rocket="🚀"
motion="🏃"
error="❌"
files_and_folders="📁"
reboot="🔁"
ok="👌"

# Adding some parameters to dnf.conf
sudo sed -i '$a\fastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True' /etc/dnf.conf

echo "=== ${rocket} Section: Installing RPM Fusion ==="
# sudo dnf install "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
# Free rmfusion
sudo dnf install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
# Non Free rmfusion
sudo dnf install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
# Enabling AppStream
sudo dnf group update core -y

# Microsoft Visual Studio Code
echo "=== ${rocket} Section: Microsoft Visual Studio Code ==="
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update

# Brave Browser
echo "=== ${rocket} Section: Brave Browser ==="
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo
sudo rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc

# Update your System
echo "=== ${rocket} Section: Updating System ==="
sudo dnf update -y

echo "=== ${rocket} Section: Installing Dependencies ==="
# Define the list of packages to install
PACKAGES=(
    'xorg-x11-server'
    'xinit'
    'firefox'
    'strow'
    'obs-studio'
    'vlc'
    'discord'
    'htop'
    'fastfetch'
    'curl'
    'zip'
    'unzip'
    'unrar'
    'git'
    'wget'
    'tree'
    'flatpak'
    'hugo'
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
    'lsd'
    'neovim'
    'arandr'
    'trash-cli'
    'tldr'
    'zsh'
    'brave-browser'
    'libreoffice-opensymbol-fonts'
    'terminus-fonts'
    'google-noto-fonts-common'
    'code'
)
# Log file for installation process
LOGFILE="install_log.txt"
echo "Installation started at $(date)" | sudo tee "$LOGFILE"

# Install each package one by one
for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    sudo dnf install -y "$package" | sudo tee -a "$LOGFILE"

    # Check if the installation was successful
    check_success "$package"
done

# Finish installation
echo "✅ All packages installed successfully!"
echo "Installation completed at $(date)" >> "$LOGFILE"

# Picom animation
echo "=== ${motion} Section: Animation ==="
git clone https://github.com/jonaburg/picom.git
cd picom || exit 1
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..
rm -rf picom


# Promote
echo "=== ${rocket} Section: Promote ==="
sudo curl -sS https://starship.rs/install.sh | sh

echo "=== ${rocket} Section: Fm6000 ==="
sudo sh -c "$(curl https://codeberg.org/anhsirk0/fetch-master-6000/raw/branch/main/install.sh)"



# Copy files to $HOME
echo "=== ${files_and_folders} Section: Copying files to $HOME ==="
# Moving Folder to the config but need a better way
cp -r dotfiles  "$HOME"

# Define the base directories
DOTFILES_DIR="$HOME/dotfiles"       # Directory containing all the dotfiles
CONFIG_DIR="$DOTFILES_DIR/.config"  # Directory containing config files inside dotfiles/.config
TARGET_CONFIG_DIR="$HOME/.config"   # Target directory to place the symbolic links for .config files

# List of files and directories inside .config to symlink to $HOME/.config
CONFIG_FILES=(
    "alacritty"
    "kitty"
    "fish"
    "picom"
    "ranger"
    "awesome"
    "htop"
    "lsd"
    "rofi"
    "bash"
    "gtk-2.0"
    "gtk-3.0"
    "gtk-4.0"
    "nvim"
    "zsh"
    "starship.toml"
)

# Ensure $HOME/.config exists
if [ ! -d "$TARGET_CONFIG_DIR" ]; then
    echo "Creating $TARGET_CONFIG_DIR directory..."
    mkdir -p "$TARGET_CONFIG_DIR"
fi

# Symlink .config files to $HOME/.config
echo "=== 🚀 Creating symbolic links in $HOME/.config ==="

for file in "${CONFIG_FILES[@]}"; do
    SOURCE="$CONFIG_DIR/$file"
    TARGET="$TARGET_CONFIG_DIR/$file"

    if [ -e "$SOURCE" ]; then
        echo "Linking $file to $TARGET_CONFIG_DIR..."
        ln -sf "$SOURCE" "$TARGET"
    else
        echo "❌ $file does not exist in $CONFIG_DIR. Skipping..."
    fi
done

# Now link other dotfiles directly to $HOME (outside of .config)
OTHER_DOTFILES=(
    ".bashrc"
    ".zshrc"
    ".fonts"
    ".screenlayout"
    ".scripts"
    ".themes"
    ".wallpapers"
    # Add any other dotfiles you want to link directly to $HOME
)

echo "=== 🚀 Creating symbolic links for other dotfiles in $HOME ==="

for file in "${OTHER_DOTFILES[@]}"; do
    SOURCE="$DOTFILES_DIR/$file"
    TARGET="$HOME/$file"

    if [ -e "$SOURCE" ]; then
        echo "Linking $file to $HOME..."
        ln -sf "$SOURCE" "$TARGET"
    else
        echo "❌ $file does not exist in $DOTFILES_DIR. Skipping..."
    fi
done

echo "✅ All files have been linked!"


echo "=== ${rocket} Section: Default Shell ==="
username="$USER"

echo "🌟 Choose a shell for user $username:"
echo "1. Fish"
echo "2. Bash"
echo "3. Zsh"
read -rp "Enter the number of your choice: " choice

case "$choice" in
    1)
        new_shell="/usr/bin/fish"
        ;;
    2)
        new_shell="/bin/bash"
        ;;
    3)
        new_shell="/usr/bin/zsh"
        ;;
    *)
        echo "❌ Invalid choice. Exiting."
        exit 1
        ;;
esac

# Check if the specified shell exists
if [ ! -e "$new_shell" ]; then
    echo "❌ The specified shell '$new_shell' does not exist."
    exit 1
fi

# Change the default shell for the user using chsh
chsh -s "$new_shell"

# Check if the chsh command was successful
if [ $? -eq 0 ]; then
    echo "✅ Default shell changed to $(basename "$new_shell") for user $username."
else
    echo "❌ Failed to change default shell for user $username."
fi


# Flat Pak Apps
echo "=== ${rocket} Section:  Flatpak Setup ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "=== ${rocket} Section: Installing Applications using Flatpak ==="

# Install Flatpak applications
install_flatpak io.github.shiftey.Desktop
install_flatpak md.obsidian.Obsidian
install_flatpak com.spotify.Client
install_flatpak io.github.mimbrero.WhatsAppDesktop
install_flatpak com.getpostman.Postman

echo "✅ Flatpak applications installed successfully."


echo "=== ${rocket} Section:  Display Manager  ==="
# Detect current display manager
if systemctl is-active --quiet display-manager.service; then
    current_dm=$(systemctl status display-manager.service | grep 'Loaded:' | awk '{print $4}' | cut -d. -f1)
else
    current_dm="None"
fi

if [ "$current_dm" != "sddm" ]; then
    echo "Current display manager: $current_dm"
    echo "This script will install and configure SDDM."
    read -p -r "Do you want to proceed? (y/n): " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        sudo dnf install sddm -y
        sudo systemctl enable sddm
        echo "SDDM has been installed and configured."
    else
        echo "Installation cancelled."
    fi
else
    echo "SDDM is already your display manager."
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