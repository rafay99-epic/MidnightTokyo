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


