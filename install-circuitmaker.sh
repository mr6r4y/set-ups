#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
set -e
OLDDIR=$(pwd)

usage()
{
    printf "%s\n" "You must supply path to CircuitMakerSetup.exe as 1st argument"
}

set -e

if [ ! $1 ]
then
    usage
    exit
fi

CIRCUIT_MAKER_SETUP=$1

echo "[*] Installing CircuitMaker"
$SCRIPT_DIR/install-winehq.sh
WINEARCH=win32 WINEPREFIX=~/.wine-circuitmaker winetricks vd=1920x1080 -q gdiplus corefonts riched20 mdac28 msxml6 dotnet40
WINEPREFIX=~/.wine-circuitmaker wine $CIRCUIT_MAKER_SETUP

echo "[*] Generate Desktop Icon for CircuitMaker"
$SCRIPT_DIR/tpl-rend.py -t "$SCRIPT_DIR/conf/CircuitMaker.desktop.tpl" -o "$HOME/Desktop/CircuitMaker.desktop"
