#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
set -e
OLDDIR=$(pwd)

# sudo apt install libqt5core5a libqt5dbus5 libqt5designer5 libqt5gui5 libqt5help5 libqt5network5 libqt5printsupport5 libqt5test5 libqt5widgets5 libqt5xml5
sudo apt install libqt6core6 libqt6dbus6 libqt6designer6 libqt6gui6 libqt6help6 libqt6network6 libqt6printsupport6 libqt6test6 libqt6widgets6 libqt6xml6