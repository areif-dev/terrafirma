#!/bin/bash

export system=(
    '@development-tools' 
    cryptsetup
    dbus
    dbus-daemon
    dbus-tools
    fwupd
    git
    man-db
    man-pages
    openssh
    openssl
    plocate
    podman
    podman-compose
    polkit
    tailscale
    xdg-user-dirs
    zsh
    zsh-autosuggestions
)
export apps=(
    bc
    distrobox
    ffmpeg
    htop
    neovim
    nvtop
    openvpn
    ranger
    unzip
    zip
)
export wifi=(
    NetworkManager
    NetworkManager-tui
    NetworkManager-wifi
    atheros-firmware
    b43-fwcutter
    b43-openfwwf
    brcmfmac-firmware
    iwlegacy-firmware
    iwlwifi-dvm-firmware
    iwlwifi-mvm-firmware
    libertas-firmware
    mt7xxx-firmware
    nxpwireless-firmware
    realtek-firmware
    tiwilink-firmware
    atmel-firmware
    zd1211-firmware
)
export all_packages=("${system[@]}" "${apps[@]}" "${wifi[@]}")
