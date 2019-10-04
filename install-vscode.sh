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

VS_CODE_EXT="maelvalais.autoconf
ms-azuretools.vscode-docker
ms-python.python
ms-vscode.cpptools
NorbertKlein.taskmarks
Nuuf.theme-hackershaze
Poorchop.theme-darktooth
asabil.meson
maziac.asm-code-lens
NathanRidley.autotrim
redhat.java
slevesque.vscode-hexdump
thiagoabreu.vala
VisualStudioExptTeam.vscodeintellicode
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
wildboar.asn1"

for vsext in $VS_CODE_EXT;
do
	code --install-extension $vsext
done

