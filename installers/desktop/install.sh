#!/bin/bash

set -ouex pipefail

# Install custom plymouth theme
dnf5 -y install plymouth-theme-solar && plymouth-set-default-theme solar -R
