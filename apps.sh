# Update
sudo pacman -Syu

# Install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Shell Tools
yay -S zsh
chsh -s $(which zsh)

yay -S fzf ripgrep tmux man-db
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

curl -sS https://starship.rs/install.sh | sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

curl https://sh.rustup.rs -sSf | sh

# TUI
yay -S ly
sudo systemctl enable ly.service

yay -S fastfetch btop htop yazi lazygit
yay -S neovim

# GUI
yay -S kitty ghostty hyprland hyprlock-git hyprpicker hyprpaper hyprshot waybar wofi pavucontrol pipewire-pulse swaync libnotify bibata-cursor-theme-bin banana-cursor-bin

# GPU (AMD Radeon RX 6700 XT)
# yay -S mesa libva-mesa-driver vulkan-radeon

# Fonts
yay -S ttf-jetbrains-mono-nerd ttf-roboto ttf-kannada-font noto-fonts-cjk

# Apps
yay -S dolphin zen-browser-bin keepass obs-studio krita vlc qimgv ark

# Configure QT based apps(Dolphin)
yay -S kvantum qt6ct breeze-icons kvantum-qt5 qt5ct papirus-icon-theme archlinux-xdg-menu kde-cli-tools

# TODO: Customize
# Icons, Wallpaper(hyprpaper)

# TODO: Install
# Clipboard Manager(wayclip/clipse),
# Timeshift for GRUB,
# Logout Menu, Widgets

# TODO: Wofi Keymaps

# TODO: Wofi Utils
# Create a script with wofi to browse utilities like:
# - Screenshot
# - Wallpaper Manager
# - Clipboard Manager
# - Color Picker
# - Image Viewer
# - Music Player
# - Video Player
# - Icons
# - Widgets

# TODO: Wofi File Finder
# Create a script to find files with wofi and open them with dolphin

# TODO: Wofi Find Windows
# Create a script to find  windows with wofi and navigate to them
