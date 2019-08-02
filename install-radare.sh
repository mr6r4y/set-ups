#!/bin/bash

#: Title: install-radare.sh
#: Description: Installs radare2 and additional packages


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

create_repo_dir "$REPODIR" "$USER"

cd $REPODIR

if [[ -e $REPODIR/radare2 ]]; then
    echo "[*] Clean repo"
    sudo rm -rf ./radare2
fi

echo "[*] Clone radare2"
git clone https://github.com/radare/radare2.git

cd radare2

# sudo make uninstall
# sudo make purge

# echo "[*] Update repo"
# git pull origin master

echo "[*] System install"
sudo sys/install.sh --install

echo "[*] r2pm init"
r2pm init

echo "[*] Install r2frida"
r2pm -ci r2frida
