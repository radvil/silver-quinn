#!/bin/bash

set -ouex pipefail

# Install LazyGit from Copr
dnf5 copr enable atim/lazygit -y
dnf5 install -y git gh lazygit
