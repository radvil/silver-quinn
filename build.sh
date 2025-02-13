#!/bin/bash

set -eou pipefail

mkdir -p /var/lib/alternatives

echo "::group:: ===Install Base Packages==="
/installers/base.sh
echo "::endgroup::"

echo "::group:: ===Install Tmux==="
/installers/tmux/install.sh
echo "::endgroup::"

echo "::group:: ===Install Git Related Packages==="
/installers/git/install.sh
echo "::endgroup::"

echo "::group:: ===Install Neovim==="
/installers/neovim/install.sh
echo "::endgroup::"

echo "::group:: ===Install Starship==="
/installers/starship/install.sh
echo "::endgroup::"

echo "::group:: ===Install Desktop==="
/installers/desktop/install.sh
echo "::endgroup::"

echo "::group:: ===Cleanup==="
/installers/cleanup.sh
echo "::endgroup::"

ostree container commit
