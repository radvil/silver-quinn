#!/bin/bash

set -eou pipefail

mkdir -p /var/lib/alternatives

echo "::group:: ===Install Base Packages==="
/installers/base.sh
echo "::endgroup::"

echo "::group:: ===Install Desktop==="
/installers/desktop/install.sh
echo "::endgroup::"

echo "::group:: ===Cleanup==="
/installers/cleanup.sh
echo "::endgroup::"

ostree container commit
