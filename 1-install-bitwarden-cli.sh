#!/usr/bin/env bash

# Install Bitwarden CLI
echo "Installing Bitwarden CLI..."
wget "https://vault.bitwarden.com/download/?app=cli&platform=linux" -O /tmp/bitwarden.zip
unzip /tmp/bitwarden.zip -d /tmp
chmod u+x /tmp/bw
mv /tmp/bw /usr/local/bin/bw
echo "Bitwarden CLI successfully installed. Please login before executing the next script. (bw login)"