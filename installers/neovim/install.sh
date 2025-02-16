#!/bin/bash

set -ouex pipefail

# Add Copr repository for Neovim nightly builds
dnf5 copr enable -y agriffis/neovim-nightly

# Install Neovim nightly
dnf5 install -y neovim
