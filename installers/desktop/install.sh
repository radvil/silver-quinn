#!/bin/bash

set -ouex pipefail

DEFAULT_BASE_IMAGE=$(grep -oP "ARG BASE_IMAGE=\"\${BASE_IMAGE:-\K[^\"]+}" Containerfile)
BASE_IMAGE=${BASE_IMAGE:-$DEFAULT_BASE_IMAGE}

echo "Installing ${BASE_IMAGE}-${RELEASE_TAG}..."

wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh

papirus-folders -C yaru

LAYERED_PACKAGES=(
  vinyl-theme
  breeze-gtk
  alacritty
  kvantum
  gparted
  lazygit
  neovim
  kitty
  code
)

# Install packages
dnf5 install -y "${LAYERED_PACKAGES[@]}"
