#!/usr/bin/env bash

# Install fastfetch
echo "Installing fastfetch..."
add-apt-repository ppa:zhangsongcui3371/fastfetch
apt update
apt install -y fastfetch
echo "fastfetch successfully installed."

# Install vscode
echo "Installing visual studio code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
apt update
apt install -y code
echo "visual studio code successfully installed."

# Install Starship
echo "Installing starship..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes
echo "starship successfully installed."

# Install Bitwarden CLI
echo "Installing Bitwarden CLI..."
wget "https://vault.bitwarden.com/download/?app=cli&platform=linux" -O /tmp/bitwarden.zip
unzip /tmp/bitwarden.zip -d /tmp
chmod u+x /tmp/bw
mv /tmp/bw /usr/local/bin/bw
echo "Bitwarden CLI successfully installed."