#!/bin/bash

set -ouex pipefail

rm -vr /config

dnf clean all
