#!/bin/bash

set -ouex pipefail

LAYERED_PACKAGES=(
    breeze-gtk
    alacritty
    gparted
    lazygit
    neovim
    kitty
    code
)

# Install packages
dnf5 install -y "${LAYERED_PACKAGES[@]}"

tee /usr/libexec/silver-quinn.sh <<'EOF'
#!/usr/bin/bash
rpm-ostree kargs --append-if-missing="splash"
rpm-ostree install brave-browser
EOF

chmod +x /usr/libexec/silver-quinn.sh
