#!/bin/bash

set -ouex pipefail

# Install vinyl theme
dnf copr enable -y ekaaty/kde-extras
dnf upgrade -y
dnf install -y vinyl-theme

# Install klassy theme
mkdir Downloads && cd Downloads
wget -O Klassy.rpm https://download.opensuse.org/repositories/home:/paul4us/Fedora_41/x86_64/klassy-6.2.breeze6.2.1-10.2.x86_64.rpm
dnf install -y Klassy.rpm

dnf5 -y swap \
    --repo terra-extras \
    gnome-shell gnome-shell &&
    dnf5 -y install \
        nautilus-gsconnect \
        steamdeck-backgrounds \
        gnome-randr-rust \
        gnome-shell-extension-appindicator \
        gnome-shell-extension-user-theme \
        gnome-shell-extension-gsconnect \
        gnome-shell-extension-compiz-windows-effect \
        gnome-shell-extension-compiz-alike-magic-lamp-effect \
        gnome-shell-extension-coverflow-alt-tab \
        gnome-shell-extension-just-perfection \
        gnome-shell-extension-blur-my-shell \
        gnome-shell-extension-hanabi \
        gnome-shell-extension-bazzite-menu \
        gnome-shell-extension-hotedge \
        gnome-shell-extension-caffeine \
        rom-properties-gtk3 \
        ibus-mozc \
        openssh-askpass \
        firewall-config &&
    dnf5 -y remove \
        gnome-classic-session \
        gnome-tour \
        gnome-extensions-app \
        gnome-system-monitor \
        gnome-initial-setup \
        gnome-shell-extension-background-logo \
        gnome-shell-extension-apps-menu &&
    mkdir -p /tmp/tilingshell &&
    curl -s https://api.github.com/repos/domferr/tilingshell/releases/latest |
    jq -r '.assets | sort_by(.created_at) | .[] | select (.name|test("^tilingshell@.*zip$")) | .browser_download_url' |
        wget -qi - -O /tmp/tilingshell/tilingshell@ferrarodomenico.com.zip &&
    unzip /tmp/tilingshell/tilingshell@ferrarodomenico.com.zip -d /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com &&
    mkdir -p /tmp/gnome-hdr &&
    curl -Lo /tmp/gnome-hdr/hdr-enableelrant.team.v2.shell-extension.zip https://extensions.gnome.org/extension-data/hdr-enableelrant.team.v2.shell-extension.zip &&
    unzip /tmp/gnome-hdr/hdr-enableelrant.team.v2.shell-extension.zip -d /usr/share/gnome-shell/extensions/hdr-enable@elrant.team &&
    chmod -R 644 /usr/share/gnome-shell/extensions/hdr-enable@elrant.team &&
    chmod 755 /usr/share/gnome-shell/extensions/hdr-enable@elrant.team &&
    curl -Lo /usr/share/thumbnailers/exe-thumbnailer.thumbnailer https://raw.githubusercontent.com/jlu5/icoextract/master/exe-thumbnailer.thumbnailer &&
    systemctl enable dconf-update.service \
