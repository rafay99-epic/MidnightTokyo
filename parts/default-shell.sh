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


# Get the current username
username="$USER"

# Prompt user to choose a shell
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
