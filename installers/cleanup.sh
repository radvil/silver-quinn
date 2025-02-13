#!/bin/bash

set -ouex pipefail

dnf upgrade -y
dnf clean all

rm -vr /config
rm -vr /tmp/build.sh
