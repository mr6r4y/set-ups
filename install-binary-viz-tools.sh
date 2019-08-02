#!/bin/bash

#: Title: install-binary-viz-tools.sh
#: Description: Includes Veles, Kaitai Struct

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

echo "[*] Install Python dependencies"
sudo apt-get -y install python3-venv libffi-dev libssl-dev

echo "[*] Install Veles"
wget -O /tmp/Veles_2018.05_64bit_Ubuntu1604.deb  https://github.com/codilime/veles/releases/download/2018.05.0.TIF/Veles_2018.05_64bit_Ubuntu1604.deb
sudo apt -y install /tmp/Veles_2018.05_64bit_Ubuntu1604.deb
rm /tmp/Veles_2018.05_64bit_Ubuntu1604.deb

echo "[*] Install Kaitai"
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv 379CE192D401AB61
echo "deb https://dl.bintray.com/kaitai-io/debian jessie main" | sudo tee /etc/apt/sources.list.d/kaitai.list
sudo apt-get update
sudo apt-get -y install kaitai-struct-compiler