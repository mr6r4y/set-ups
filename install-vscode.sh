#!/bin/bash

#: Title: install-vscode.sh
#: Description: Installation of VS Code and additional components

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

set -e


sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

# $SCRIPT_DIR/install-nodejs10.sh
# sudo apt -y install git
# sudo npm install -g typescript
# wget --content-disposition https://go.microsoft.com/fwlink/?LinkID=760868
# sudo apt -y install ./code_*.deb

# VSCODE_EXT_FL="$SCRIPT_DIR/conf/vscode-ext.txt"
# while IFS= read -r line
# do
# 	code --install-extension "$line"
# done < "$VSCODE_EXT_FL"

