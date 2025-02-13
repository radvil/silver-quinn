#!/bin/bash

set -ouex pipefail

# Apply IP Forwarding before installing Docker to prevent messing with LXC networking
sysctl -p

# Install base packages

sysadmin_packages=(
    "subscription-manager"
    "cockpit-navigator"
    "cockpit-bridge"
    "cockpit-system"
    "cockpit-selinux"
    "cockpit-networkmanager"
    "cockpit-storaged"
    "cockpit-podman"
    "cockpit-machines"
    "cockpit-kdump"
    "libguestfs-tools"
    "NetworkManager-tui"
    "virt-install"
    "virt-manager"
    "virt-viewer"
)

programming_packages=(
    "code"
    "gh"
    "insync"
    "nodejs"
    "zed"
    "jq"
    "wget"
)

utility_packages=(
    "syncthing"
)

docker_packages=(
    "docker-ce"
    "docker-ce-cli"
    "containerd.io"
    "docker-buildx-plugin"
    "docker-compose-plugin"
)

packages=(
    ${sysadmin_packages[@]}
    ${programming_packages[@]}
    ${utility_packages[@]}
    ${docker_packages[@]}
)

# install rpms
dnf5 install -y ${packages[@]}
