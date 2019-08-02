#!/bin/bash

#: Title: fscrypt-setup.sh
#: Description: Setup fscrypt folder encryption

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

export DEVICE="$(df / | sed -n 2p | cut -d" " -f1)"

PAGE_SIZE_1=$(getconf PAGE_SIZE)
PAGE_SIZE_2=$(sudo tune2fs -l $DEVICE | grep 'Block size' | sed 's/Block size: //')


if [ $PAGE_SIZE_1 != $PAGE_SIZE_2 ]; then
	echo "[!] Page sizes differ: $PAGE_SIZE_1 != $PAGE_SIZE_2"
	exit 1
fi

echo "[*] Configure $DEVICE to enable encryption"
sudo tune2fs -O encrypt $DEVICE

echo "[*] Install fscrypt and pam support"
sudo apt-get -y install fscrypt libpam-fscrypt

echo "[*] Setup PAM"
sudo cp $SCRIPT_DIR/conf/keyinit-fix /usr/share/pam-configs/keyinit-fix
sudo pam-auth-update

echo "[*] Setup fscrypt"
sudo fscrypt setup
sudo fscrypt setup /
