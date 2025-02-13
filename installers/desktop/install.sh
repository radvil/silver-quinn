#!/bin/bash

set -ouex pipefail

# Install Gnome Session Packages
dnf5 -y install \
    nautilus-gsconnect \
    gnome-shell \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-user-theme \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    firewall-config

# Remove unnecessary gnome packages
dnf5 -y remove \
    gnome-classic-session \
    gnome-tour \
    gnome-extensions-app \
    gnome-system-monitor \
    gnome-initial-setup

# Install KDEklassy theme
wget -O Klassy.rpm https://download.opensuse.org/repositories/home:/paul4us/Fedora_41/x86_64/klassy-6.2.breeze6.2.1-10.2.x86_64.rpm
dnf install -y Klassy.rpm
rm -rf Klassy.rpm

# Install KDE vinyl theme
dnf copr enable -y ekaaty/kde-extras
dnf install -y vinyl-theme
