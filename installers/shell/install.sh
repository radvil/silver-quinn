#!/bin/bash

set -ouex pipefail

# Install zsh
dnf5 install -y zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Set default shell to zsh
# chsh -s /bin/zsh

# Install fish shell
dnf5 install -y fish

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Set starship as shell prompt
echo "eval "$(starship init zsh)"" >>~/.zshrc
echo "eval "$(starship init fish)"" >>~/.config/fish/config.fish

# Install fzf
dnf5 install -y fzf

# Install ripgrep
dnf5 install -y ripgrep

# Install fd
dnf5 install -y fd

# Install bat
dnf5 install -y bat

# Install zoxide
cargo install zoxide

# Install zoxide completion
zoxide init fish >~/.config/fish/completions/zoxide.fish
zoxide init zsh >~/.zshrc
