# MidnightTokyo

To simplify the configuration process for the Awesome Window Manager on Fedora, I have created an easy script. This script automates the installation of various applications and dependencies required by the window manager, making it convenient for users to set up their desktop environment.

### Prerequisites

- This script should be run as a user, not as root.
- Make sure you are using Fedora as your operating system.

### Script Execution

1. Open a terminal.

2. Copy the script into a file and save it with a `.sh` extension (e.g., `awesome_setup.sh`).

3. Make the script executable:
    ```bash
    chmod +x fedora.sh
    ```

4. Run the script:
    ```bash
    ./fedora.sh
    ```

### Script Explanation

The script performs the following actions:

1. Updates the Fedora system by running `sudo dnf update -y`.

2. Installs dependencies and applications required by the Awesome Window Manager using the Fedora package manager (`dnf`). These include applications like dmenu, rofi, Firefox, Kitty, Alacritty, and others. The script uses an array of package names for installation.

3. Installs fonts required for a consistent and visually pleasing desktop environment.

4. Sets up Picom to enable animations and transparency.

5. Installs the Brave browser for an enhanced browsing experience.

6. Adds the Tela-circle icon pack to customize the appearance of icons.

7. Copies necessary configuration files (including fonts, screen layouts, scripts, themes, and shell configurations) to the appropriate directories in the user's home folder (`$HOME/.config`).

8. Prompts the user to reboot the system to apply the changes. The user can choose to reboot or not.

# Look & Feel
## Desktop
![desktop](/images/Rafay-Desktop-first-Image.png)
## Multiple Terminals
![multiple-terminal](/images/terminal-Shot.png)
## Single Terminal
![single-terminal](/images/termina-single-shot.png)
<!-- ## Rofi
![rofi](/images/rofi-shot.png) -->

# Credits
- [Awesome Window Manager](https://awesomewm.org/)
- [Fedora](https://getfedora.org/)
- [Tela-circle Icon Pack](https://github.com/vinceliuice/Tela-circle-icon-theme)
- [Picom](https://github.com/jonaburg/picom)
- [Orginal-Config](https://github.com/micro-hawk/awesomight)

# Contributions
Thank you so much to taking interset into this Project checkout the [Contributing.md](/Contributing.md) for more information.

# License
This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.

# Author

My name is [Abdul Rafay](https://future-insight.blog/author), and I am the maintainer of the MidnightTokyo project. If you have any questions, issues, or suggestions, feel free to reach out to me. You can use the discussion tab in the project repository or contact me directly through my [website](https://future-insight.blog/contact).

I am excited to collaborate with contributors and appreciate your interest in improving MidnightTokyo. Your contributions and feedback are valuable in shaping the future of this project. Let's work together to make MidnightTokyo an amazing desktop environment!
