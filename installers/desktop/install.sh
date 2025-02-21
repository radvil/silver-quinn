#!/bin/bash

set -ouex pipefail

LAYERED_PACKAGES=(
  papirus-icon-theme
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
