#!/bin/bash

#: Title: fscrypt-encrypt-folders.sh
#: Description: Encrypt critical folders

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

FOLDERS_TO_ENCRYPT=".ssh .mozilla .local .config workspace"

for i in $FOLDERS_TO_ENCRYPT
do
	echo "[*] Encrypting $HOME/$i"
	mv $HOME/$i $HOME/$i.bkp
	mkdir $HOME/$i
	fscrypt encrypt $HOME/$i
	rsync -avH --info=progress2 --info=name0 $HOME/$i.bkp/ $HOME/$i/
	# echo "[*] Remove backup $HOME/$i.bkp"
	# rm -rf $HOME/$i.bkp
done
