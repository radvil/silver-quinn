#!/bin/bash

set -ouex pipefail

dnf upgrade -y
dnf clean all

rm -vr /installers
rm -vr /tmp/build.sh
