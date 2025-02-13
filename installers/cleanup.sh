#!/bin/bash

set -ouex pipefail

dnf clean all

rm -vr /installers
rm -vr /tmp/build.sh
