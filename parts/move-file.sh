#!/bin/bash

clear
echo "

        ███╗   ███╗██╗██████╗ ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗  ████████╗ ██████╗ ██╗  ██╗██╗   ██╗ ██████╗ 
        ████╗ ████║██║██╔══██╗████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝  ╚══██╔══╝██╔═══██╗██║ ██╔╝╚██╗ ██╔╝██╔═══██╗
        ██╔████╔██║██║██║  ██║██╔██╗ ██║██║██║  ███╗███████║   ██║        ██║   ██║   ██║█████╔╝  ╚████╔╝ ██║   ██║
        ██║╚██╔╝██║██║██║  ██║██║╚██╗██║██║██║   ██║██╔══██║   ██║        ██║   ██║   ██║██╔═██╗   ╚██╔╝  ██║   ██║
        ██║ ╚═╝ ██║██║██████╔╝██║ ╚████║██║╚██████╔╝██║  ██║   ██║        ██║   ╚██████╔╝██║  ██╗   ██║   ╚██████╔╝
        ╚═╝     ╚═╝╚═╝╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝                
                                            
                                            Move File Setup Script
"

# Define the list of folders to copy
folders_to_copy=(.scripts .fonts .themes .bashrc .zshrc .wallpapers)
config_folders_to_copy=(alacritty awesome bash fish gtk-2.0 gtk-3.0 gtk-4.0 htop kitty lsd neofetch nvim picom ranger rofi starship.toml zsh)

# Function to create a directory if it doesn't exist
create_directory() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1" || { echo "Error creating directory: $1"; exit 1; }
    fi
}

# Function to rename a folder with .old suffix if it exists
rename_existing_folder() {
    if [ -d "$1" ]; then
        mv "$1" "$1.old" || { echo "Error renaming folder: $1"; exit 1; }
    fi
}

# 📂 Create or check and rename the necessary directories
create_directory "$HOME/.config"
for folder in "${config_folders_to_copy[@]}"; do
    rename_existing_folder "$HOME/.config/$folder"
done

# 📁 Copy the folders and files
for item in "${folders_to_copy[@]}"; do
    cp -r "$item" "$HOME/" || { echo "Error copying folder: $item"; exit 1; }
done

cd .config/ || { echo "Error changing directory to .config/"; exit 1; }

for item in "${config_folders_to_copy[@]}"; do
    cp -r "$item" "$HOME/.config/" || { echo "Error copying folder: $item"; exit 1; }
done

cd ..

echo "✨ Configuration files and folders copied successfully."
