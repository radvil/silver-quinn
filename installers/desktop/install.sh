#!/bin/bash

set -ouex pipefail

# Install Cosmic DE
dnf5 -y copr enable ryanabx/cosmic-epoch

COSMIC_PACKAGES=(
    cosmic-desktop
    NetworkManager-openvpn
)

LAYERED_PACKAGES=(
    plymouth-theme-solar
    vinyl-theme
    breeze-gtk
    alacritty
    gparted
    lazygit
    neovim
    kitty
    code
)

# Install packages
dnf5 install -y "${COSMIC_PACKAGES[@]}" "${LAYERED_PACKAGES[@]}"

plymouth-set-default-theme solar

tee /usr/libexec/silver-quinn.sh <<'EOF'
#!/usr/bin/bash
rpm-ostree kargs --append-if-missing="splash"
rpm-ostree install brave-browser
EOF

chmod +x /usr/libexec/silver-quinn.sh
