#!/bin/bash

#: Title: install-lua.sh
#: Description: Install latest Lua from source
#: References:

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt -y install libreadline-dev

create_repo_dir "$REPODIR" "$USER"

# Clone exploitdb from GitHub
cd $REPODIR
wget http://www.lua.org/ftp/lua-5.3.5.tar.gz
tar zxf lua-5.3.5.tar.gz
cd lua-5.3.5
make linux test
sudo make install

cd $REPODIR
wget https://luarocks.org/releases/luarocks-3.2.0.tar.gz
tar zxpf luarocks-3.2.0.tar.gz
cd luarocks-3.2.0
./configure
make
sudo make install

cd $OLDDIR
