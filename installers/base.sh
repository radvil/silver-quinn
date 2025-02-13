#!/bin/bash

set -ouex pipefail

# Apply IP Forwarding before installing Docker to prevent messing with LXC networking
sysctl -p

# Install base packages

sysadmin_packages=(
    "@virtualization"
    "NetworkManager-tui"
    "virt-install"
    "virt-manager"
    "virt-viewer"
    "podman"
)

programming_packages=(
    "nodejs"
    "code"
    "wget"
    "zed"
    "git"
    "gh"
    "jq"
)

utility_packages=(
    "syncthing"
    "fastfetch"
    "starship"
    "ripgrep"
    "fish"
    "zsh"
    "fzf"
    "fd"
    "bat"
)

packages=(
    ${sysadmin_packages[@]}
    ${programming_packages[@]}
    ${utility_packages[@]}
)

# install rpms
dnf5 install -y ${packages[@]}
