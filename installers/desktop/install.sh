#!/bin/bash

set -ouex pipefail

# Install KDE vinyl theme
dnf5 copr enable -y ekaaty/kde-extras

dnf5 install -y vinyl-theme breeze-gtk gparted

# Install custom plymouth theme
dnf5 -y install plymouth-theme-solar && \
	plymouth-set-default-theme solar

# Install Brave Browser
curl -fsS https://dl.brave.com/install.sh | sh
