#!/bin/bash

set -ouex pipefail

# Install custom plymouth theme
dnf5 -y install plymouth-theme-solar &&
  plymouth-set-default-theme solar

# Install brave browser
dnf install -y 'dnf-command(config-manager)'
dnf config-manager addrepo -y --overwrite --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf install -y brave-browser --refresh
