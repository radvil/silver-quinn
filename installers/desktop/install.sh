#!/bin/bash

set -ouex pipefail

DEFAULT_BASE_IMAGE=$(grep -oP "ARG BASE_IMAGE=\"\${BASE_IMAGE:-\K[^\"]+}" Containerfile)
BASE_IMAGE=${BASE_IMAGE:-$DEFAULT_BASE_IMAGE}

echo "Using BASE_IMAGE » ${BASE_IMAGE}..."

wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh

papirus-folders -C yaru

KDE_PACKAGES=(
  kvantum
  breeze-gtk
)

LAYERED_PACKAGES=(
  vinyl-theme
  alacritty
  gparted
  lazygit
  neovim
  kitty
  code
)

# Only install KDE packages if not using GNOME variant
if [[ "$IS_GNOME_VARIANT" != "1" ]]; then
  dnf5 install -y "${KDE_PACKAGES[@]}"
fi

# Install layered packages
dnf5 install -y "${LAYERED_PACKAGES[@]}"
