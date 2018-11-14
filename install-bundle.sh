#!/bin/bash

set -e

sudo apt-get -y install git
git clone https://github.com/mr6r4y/set-ups.git

cd set-ups/

./install-base-dev.sh
./install-tmux.sh
./install-webauto.sh
./install-exploitdb.sh
./install-netsec.sh
./install-free-proxies.sh

cd -
