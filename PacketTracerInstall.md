# Packet Tracer Installation steps

1. Download `.deb` file from [Cisco website](https://www.netacad.com/resources/lab-downloads)
2. Clone the AUR repo using `git clone https://aur.archlinux.org/packettracer.git`
3. Move the `.deb` file in cloned repo's root directory
4. Install using `makepkg -si`
5. Run the application with `/usr/lib/packettracer/packettracer.AppImage`
6. If you find some issue with QT, add this to your `.desktop` file

```sh
$ /usr/lib/packettracer/packettracer.AppImage
Cisco_Packet_Tracer_9.0.0:b3ff134c88b008deda94147e4c7ac664:/usr/lib/packettracer/packettracer.AppImage
Fatal: This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

Available platform plugins are: linuxfb, xcb.

zsh: IOT instruction (core dumped)  /usr/lib/packettracer/packettracer.AppImage
```

```desktop
# ~/.local/share/applications/CiscoPacketTracer-9.0.0.desktop
[Desktop Entry]
Name=Cisco Packet Tracer 9.0.0
Type=Application
Categories=Education;
Exec=env QT_QPA_PLATFORM=xcb /usr/lib/packettracer/packettracer.AppImage %f
Icon=Cisco_Packet_Tracer_9.0.0
Terminal=false
StartupNotify=true
MimeType=application/x-pkt;application/x-pka;application/x-pkz;application/x-pks;application/x-pksz;
```
