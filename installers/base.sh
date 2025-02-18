#!/bin/bash

set -ouex pipefail

# Apply IP Forwarding before installing Docker to prevent messing with LXC networking
sysctl -p

# Install base packges

core_packages=(
  "NetworkManager-tui"
  "vinyl-theme"
  "breeze-gtk"
  "gparted"
  "lazygit"
  "podman"
  "code"
  "obs-studio"
  "alacritty"
  "nodejs"
  "kitty"
  "tmux"
  "wget"
  "zed"
  "git"
  "gh"
  "jq"
)

utility_packages=(
  "fastfetch"
  "starship"
  "ripgrep"
  "fish"
  "zsh"
  "fzf"
  "bat"
  "fd"
)

packages=(
  "${core_packages[@]}"
  "${utility_packages[@]}"
)

dnf5 install --refresh -y "${packages[@]}"
