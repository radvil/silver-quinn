#!/bin/bash

set -ouex pipefail

# Install KDE vinyl theme
dnf copr enable -y ekaaty/kde-extras

dnf5 install -y vinyl-theme breeze-gtk gparted
