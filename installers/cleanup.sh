#!/bin/bash

set -ouex pipefail

dnf clean all

rm -vr /config
rm -vr /tmp/build.sh
