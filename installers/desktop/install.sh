#!/bin/bash

set -ouex pipefail

# Install custom plymouth theme
dnf5 -y install plymouth-theme-solar

# Install Cosmic DE
dnf5 -y copr enable ryanabx/cosmic-epoch

COSMIC_PACKAGES=(
    cosmic-desktop
    gnome-keyring
    NetworkManager-openvpn
)

LAYERED_PACKAGES=(
    adw-gtk3-theme
    vinyl-theme
    breeze-gtk
    alacritty
    gparted
    lazygit
    neovim
    kitty
    code
)

# Install packagees
dnf5 install -y "${COSMIC_PACKAGES[@]}" "${LAYERED_PACKAGES[@]}"

# System setup
systemctl enable cosmic-greeter
plymouth-set-default-theme solar

rpm-ostree kargs --append-if-missing="splash"