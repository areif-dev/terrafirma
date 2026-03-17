#!/usr/bin/env bash

set -ouex pipefail 

curl -Lo /etc/yum.repos.d/hyprland.repo https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-43/solopasha-hyprland-fedora-43.repo

# Install packages
source /ctx/packages.sh
dnf5 install -y --exclude=nfs-utils "${all_packages[@]}"

# Enable/Disable services 
systemctl enable libvirtd 

# Cleanup 
dnf5 clean all 
dnf5 autoremove -y
