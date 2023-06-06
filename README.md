# MidnightTokyo
Welcoem of MidnightTokyo, a simple and beautiful Awesome Window Manager configuration. This repo contains all the dotfiles to have a stunning look like the image below.

![look-&-Feel](/images/Midnight-Tokyo.png)

# Installation
## Manual Installation
1. Install the dependencies and application listed in the [pkglist-fedora](/Docs/pkglist-fedora) file.
2. Copy files into your .config folder.
    ```bash
        cp -r .config/*  $HOME/.config/
    ```
3. Copy files into your Home Directory.
    ```bash
        cp -r .fonts .screenlayout .scripts .themes .bashrc .zshrc  $HOME/
    ```
4. Move Wallpapers to $HOME/Pictures
    ```bash
        cp -r Toky-Wallpapers $HOME/Pictures
    ```
5. Restart your system.

## Automatic Installation
***If yuu are running Fedora, you can use the script to install the Awesome Window Manager and its dependencies.***

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
5. Restart your system.
# Keybindings
You can find the keybindings in the [keybindings.md](/Docs/Keybinding.md) file.
# Features
- Simple enough for beginner's but flexible enough for the power user.
- Extremely customizable, maybe more so than any other window manager.
Configured in Lua.
- A documented API to configure and define the behavior of your window manager.

# Gallery

![desktop](/images/cyber-punk-wallpaper.png)
![multiple-terminal](/images/multiple-terminal-3.png)
![single-terminal](/images/code-termina.png)

# Acknowledgments
This Project was never possible without the following projects.
- [Awesome Window Manager](https://awesomewm.org/)
- [Fedora](https://getfedora.org/)
- [Tela-circle Icon Pack](https://github.com/vinceliuice/Tela-circle-icon-theme)
- [Picom](https://github.com/jonaburg/picom)

Special thanks to [Micro Hawk](https://github.com/micro-hawk/awesomight) for the inspiration.

# Contributions
Thank you so much to taking interset into this Project checkout the [Contributing.md](/Docs/Contributing.md) for more information.

# License
This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.

# Author
My name is [Abdul Rafay](https://future-insight.blog/author), and I am the maintainer of the MidnightTokyo project. If you have any questions, issues, or suggestions, feel free to reach out to me. You can use the [Discussion Tab](https://github.com/rafay99-epic/MidnightTokyo/discussions) in the project repository or contact me directly through my [website](https://future-insight.blog/contact).

I am excited to collaborate with contributors and appreciate your interest in improving MidnightTokyo. Your contributions and feedback are valuable in shaping the future of this project. Let's work together to make MidnightTokyo an amazing desktop environment!

# Disclaimer

**Please read this disclaimer carefully before using or contributing to the Midnight Tokyo project.**

- The Midnight Tokyo project is an independent effort and is not affiliated with the Awesome Window Manager or any other mentioned projects. Any references made to external projects are for informational purposes only.

- The images used in this project are sourced from my personal system. If you wish to use these images, you can find them in the [Tokyo-Wallpapers](/Tokyo-Wallpapers) and [images](/images/) folders.

- While the Midnight Tokyo project strives to provide a seamless and captivating user experience, it is important to note that the project is not responsible for any damage or issues that may occur on your system. By using or contributing to this project, you acknowledge and accept that any modifications or installations are done at your own risk.

- It is highly recommended to carefully read and understand the installation instructions and review the installation script before proceeding with the installation of the Midnight Tokyo project. Ensure that you have a backup of your system and follow the instructions closely to avoid any unforeseen issues.

- For further information regarding the project and its usage, please refer to the [License](/LICENSE).

By using or contributing to the Midnight Tokyo project, you agree to the terms and conditions outlined in this disclaimer.

If you have any concerns or questions, please reach out to the project maintainers for clarification.

**Note:** This disclaimer is provided as a general guideline and should be reviewed by legal professionals to ensure it meets the specific requirements and regulations of your project or organization.