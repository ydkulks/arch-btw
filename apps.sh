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

# Password Manager
yay -S pass github-cli openssh
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
mkdir -p $GNUGPGHOME
chmod 700 $GNUPGHOME
ssh-keygen -t rsa
ssh-agent ~/.ssh/id_rsa

# Timeshift
yay -S timeshift grub-btrfs inotify-tools timeshift-autosnap
sudo systemctl enable grub-btrfsd
sudo systemctl start grub-btrfsd
#sudo systemctl edit --full grub-btrfsd # Modify for timeshift compatibility

# Terminal
yay -S ghostty

# Login Manager
yay -S ly
sudo systemctl enable ly.service

# Command Line Tools
yay -S fastfetch btop htop yazi lazygit

# Editor
yay -S neovim

# Hyprland
yay -S hyprland hyprlock-git hyprpicker hyprpaper hyprshot

# Cursor
yay -S bibata-cursor-theme-bin banana-cursor-bin

# Status Bar
yay -S pavucontrol pipewire-pulse swaync libnotify nm-connection-editor network-manager-applet
# EWW
yay -S eww-git socat gnome-calendar glib2 dconf networkmanager-dmenu-git


# Rofi
yay -S rofi rofi-emoji cliphist wtype wl-clipboard rofi-calc

# GPU (AMD Radeon RX 6700 XT)
# yay -S mesa libva-mesa-driver vulkan-radeon

# Fonts
yay -S ttf-jetbrains-mono-nerd ttf-roboto ttf-kannada-font noto-fonts-cjk noto-fontse-emoji ttf-oswald

# Apps
yay -S dolphin zen-browser-bin keepass obs-studio krita qimgv ark evince localsend-bin libreoffice-still

# Configure QT based apps(Dolphin)
yay -S kvantum qt6ct breeze-icons kvantum-qt5 qt5ct papirus-icon-theme archlinux-xdg-menu kde-cli-tools

# TODO: Customize
# Fastfetch

# TODO: Install
# Timeshift for GRUB,
# Widgets

# TODO: Rofi Utils
# Create a script with rofi to browse utilities like:
# - [x] Wallpaper Manager
# - [x] Clipboard Manager (Super V)
# - [x] Emoji Picker (modi)
# - [x] File Browser (modi)
# - [x] Window Switcher (Alt Shift Tab)
# - [x] Hyprland Keybinds (Super Shift ?)
# - [x] Calculator (modi)
# - [x] Run Scripts
