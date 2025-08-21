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
yay -S kitty ghostty hyprland hyprlock-git waybar wofi pavucontrol pipewire-pulse swaync libnotify

# GPU (AMD Radeon RX 6700 XT)
# yay -S mesa libva-mesa-driver vulkan-radeon

# Fonts
yay -S ttf-jetbrains-mono-nerd ttf-roboto ttf-kannada-font noto-fonts-cjk

# Apps
yay -S dolphin zen-browser-bin key-pass

# Configure QT based apps(Dolphin)
yay -S kvantum qt6ct breeze-icons kvantum-qt5 qt5ct papirus-icon-theme

# TODO: Customize
# Dolphin, Hyprland

# TODO: Install
# Screenshot, Wallpaper(hyprpaper), OBS Studios, Krita, Clipboard Manager(wayclip),
# Hyprpicker, Video Player, Image Viewer, Timeshift for GRUB
