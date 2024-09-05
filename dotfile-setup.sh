#!/usr/bin/env bash

# Bitwarden login
echo "Logging into Bitwarden..."
bw login

# Install chezmoi and apply dotfiles
echo "Installing chezmoi and setting up dotfiles..."
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lenuswalker
echo "chezmoi installed and dotfiles configured."