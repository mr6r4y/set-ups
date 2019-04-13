#!/bin/bash

#: Title: install-crypto-tools.sh
#: Description: Installs RsaCtfTool, SageMath, etc

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-get update
sudo apt-get -y install python3-gmpy2 sagemath

create_repo_dir "$REPODIR" "$USER"

# Clone RsaCtfTool from GitHub
cd $REPODIR
if [[ ! -e $REPODIR/RsaCtfTool ]]; then
    echo "[*] Clone RsaCtfTool"
    git clone https://github.com/Ganapati/RsaCtfTool.git
fi
cd $OLDDIR

