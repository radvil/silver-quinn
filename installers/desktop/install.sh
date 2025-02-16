#!/bin/bash

set -ouex pipefail

# Install custom plymouth theme
dnf5 -y install plymouth-theme-solar &&
  plymouth-set-default-theme solar

# Install brave browser
# dnf5 install -y 'dnf-command(config-manager)'
# dnf5 config-manager addrepo -y --overwrite --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
# dnf5 install -y brave-browser --refresh
