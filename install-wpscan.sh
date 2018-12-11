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

install_rvm

# Install ruby version for wpscan
RUBYVERSION=$(wget https://raw.githubusercontent.com/wpscanteam/wpscan/master/.ruby-version -q -O - )
echo "[*] Installing/using ruby $RUBYVERSION"
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default

echo "[*] Install wpscan from gem"
gem install wpscan

cd $OLDDIR

