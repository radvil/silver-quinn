#!/bin/bash

set -ouex pipefail

# Install KDE vinyl theme
dnf copr enable -y ekaaty/kde-extras

dnf5 install -y vinyl-theme breeze-gtk gparted

# Install custom plymouth theme
dnf -y install plymouth-theme-solar && \
	plymouth-set-default-theme solar && \
	plymouth-set-default-theme -R
