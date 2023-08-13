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
#  Rename & Detecting Existing Folders
config_dir="$HOME/.config"
folders=("alacrity" "kitty" "fish" "picom" "ranger" "awesome" "htop" "lsd" "rofi" "bash" "gtk-2.0" "gtk-3.0" "gtk-4.0" "nvim" "picom" "zsh" "starship.toml")

for folder in "${folders[@]}"; do
    folder_path="$config_dir/$folder"
    if [ -d "$folder_path" ]; then
        mv "$folder_path" "$folder_path.old"
        echo "Renamed $folder to $folder.old"
    else
        echo "$folder not found"
    fi
done


# Moving Folders
config_dir="$HOME/.config"
source_dirs=("alacrity" "kitty" "fish" "picom" "ranger" "awesome" "htop" "lsd" "rofi" "bash" "gtk-2.0" "gtk-3.0" "gtk-4.0" "nvim" "picom" "zsh" "starship.toml")

for source_dir in "${source_dirs[@]}"; do
    source_path="$config_dir/$source_dir"
    
    if [ -d "$source_path" ]; then
        for file in "$source_path"/*; do
            if [ -f "$file" ]; then
                cp -r  "$file" "$config_dir/"
                echo "Moved $file to $config_dir"
            fi
        done
    else
        echo "$source_dir not found"
    fi
done

echo "Files are moved! 🚀"
