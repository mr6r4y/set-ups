#!/bin/bash

#: Title: install-wpscan.sh
#: Description: Installation of wpscan from source
#: References:
#:      * https://github.com/OJ/gobuster

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

echo "[*] Install wpscan"

cd $REPODIR
if [[ ! -e $REPODIR/wpscan ]]; then
    echo "[*] Clone wpscan"
    git clone https://github.com/wpscanteam/wpscan.git
fi

install_rvm

# Install ruby version for wpscan
RUBYVERSION=$(wget https://raw.githubusercontent.com/wpscanteam/wpscan/master/.ruby-version -q -O - )
echo "[*] Installing/using ruby $RUBYVERSION"
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default

cd wpscan

bundle install && rake install

WPSCAN_EXEC=$(which wpscan)

# link_to_usr_local_bin "$WPSCAN_EXEC"

cd $OLDDIR