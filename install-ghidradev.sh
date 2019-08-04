#!/bin/bash

#: Title: install-ghidradev.sh
#: Description: Installs all dependencies from https://github.com/NationalSecurityAgency/ghidra/blob/master/DevGuide.md


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

echo "[*] Install bison and flex"
sudo apt-get -y install bison flex

create_repo_dir "$REPODIR" "$USER"

cd $REPODIR

if [[ ! -e /usr/local/bin/gradle-5 ]]; then
	echo "[*] Download Gradle"
	wget "https://services.gradle.org/distributions/gradle-5.0-bin.zip"
	unzip gradle-5.0-bin.zip

	sudo ln -s $REPODIR/gradle-5.0/bin/gradle /usr/local/bin/gradle-5
fi

if [[ ! -e $REPODIR/ghidra ]]; then
    echo "[*] Clone Ghidra"
    git clone https://github.com/NationalSecurityAgency/ghidra.git
fi

cd ghidra

echo "[*] Build Ghidra"
git pull origin master
gradle-5 --init-script gradle/support/fetchDependencies.gradle init
gradle-5 buildNatives_linux64
gradle-5 buildGhidra
