# Notes

## Ricing

1. **Dolphin**:
    - [Dolphin Theming](https://www.reddit.com/r/hyprland/comments/1byyrix/help_dolphin_theming/)
    - Dependencies:

    ```sh
    # Configure QT based apps(Dolphin)
    yay -S dolphin kvantum qt6ct breeze-icons kvantum-qt5 qt5ct
    ```

    - Config files to edit:
        - `~/.config/kdeglobals`

        ```conf
        [Colors:View]
        BackgroundNormal=#2E2E2E
        ```

        - `~/.config/dolphinrc`

        ```conf
        [UiSettings]
        ColorScheme=BreezeDark
        ```

        - `~/.config/hypr/hyprland.conf`

        ```conf
        exec-once = dbus-update-activation-environment --systemd --all

        env = QT_QPA_PLATFORMTHEME,qt6ct
        env = QT_QPA_PLATFORM,wayland
        env = XDG_ICON_THEME,Papirus-Dark
        ```

        - `~/.config/qt6ct/qt6ct.conf`

3. **Default Apps**:
    - `~/.config/mimeapps.list`

4. **Eww**:
    - [Getting Started](https://dharmx.is-a.dev/eww-powermenu/)
    - Basic `eww` commands

        ```sh
        eww logs
        eww open {wedget-name}
        eww inspector
        eww kill
        ```
