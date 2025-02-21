#!/bin/bash

set -ouex pipefail

wget -qO- https://git.io/papirus-icon-theme-install | sh

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
