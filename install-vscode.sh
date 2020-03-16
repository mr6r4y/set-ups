#!/bin/bash

#: Title: install-vscode.sh
#: Description: Installation of VS Code and additional components

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

set -e

$SCRIPT_DIR/install-nodejs10.sh
sudo apt -y install git
sudo npm install -g typescript
wget --content-disposition https://go.microsoft.com/fwlink/?LinkID=760868
sudo apt -y install ./code_*.deb

VSCODE_EXT_FL="$SCRIPT_DIR/conf/vscode-ext.txt"
while IFS= read -r line
do
	code --install-extension "$line"
done < "$VSCODE_EXT_FL"

