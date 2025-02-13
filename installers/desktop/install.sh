#!/bin/bash

set -ouex pipefail

# Install KDEklassy theme
wget -O Klassy.rpm https://download.opensuse.org/repositories/home:/paul4us/Fedora_41/x86_64/klassy-6.2.breeze6.2.1-10.2.x86_64.rpm
dnf install -y Klassy.rpm
rm -rf Klassy.rpm

# Install KDE vinyl theme
dnf copr enable -y ekaaty/kde-extras
dnf install -y vinyl-theme
