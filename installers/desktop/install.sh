#!/bin/bash

set -ouex pipefail

# Install KDE vinyl theme
dnf5 copr enable -y ekaaty/kde-extras

dnf5 install -y vinyl-theme breeze-gtk gparted

# Install custom plymouth theme
dnf5 -y install plymouth-theme-solar && \
	plymouth-set-default-theme solar

# Install web browser
dnf5 config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y
dnf5 install -y brave-browser
