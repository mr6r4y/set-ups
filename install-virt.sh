#!/bin/bash

#: Title: install-virt.sh
#: Description: Installs kvm, qemu, libvirt, etc


SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

set -e

OLDDIR=$(pwd)

sudo apt-get update

sudo apt-get -y install qemu-utils qemu-user qemu-system
sudo apt-get -y install qemu-kvm virt-manager libvirt-daemon-system virtinst libvirt-clients bridge-utils libvirt-dev
