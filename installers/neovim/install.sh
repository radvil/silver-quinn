#!/bin/bash

set -ouex pipefail

# Add Copr repository for Neovim nightly builds
dnf copr enable -y agriffis/neovim-nightly

# Install Neovim nightly
dnf install -y neovim
