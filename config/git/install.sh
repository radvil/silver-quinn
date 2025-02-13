#!/bin/bash

set -ouex pipefail

# Install git
dnf install -y git gh

# Configure git
git config --global user.name "Radvil"
git config --global user.email "radvil.linux@gmail.com"
git config --global core.editor "nvim"
git config --global color.ui true

# Configure gh
gh config set editor "nvim"
gh config set git_protocol "ssh"
gh config set prompt "disabled"
gh config set editor "nvim"

# Install LazyGit from Copr
dnf copr enable atim/lazygit -y
dnf install lazygit
