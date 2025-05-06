#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
apt update && apt upgrade
grep -v '^#' ./devbox.packages | xargs apt install -y

# Install non-repo packages
./non-repo-packages.sh

# Setup dotfiles
./dotfile-setup.sh