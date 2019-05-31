#!/bin/bash

USER="user"

# Remove error message for missing /dev/fd0
#     https://tinycp.com/community/show/solved-print-req-error-i-o-error-dev-fd0-sector-0,43.html#sidebar
sudo rmmod floppy
sudo sh -c 'echo "blacklist floppy" | tee /etc/modprobe.d/blacklist-floppy.conf'
sudo dpkg-reconfigure initramfs-tools

# Upgrade
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# For iwconfig
sudo apt-get -y install wireless-tools
# Install network-manager and its nmcli/nmtui interfaces
sudo apt-get -y install network-manager

# Stop waiting for network at init:
#     https://askubuntu.com/questions/972215/a-start-job-is-running-for-wait-for-network-to-be-configured-ubuntu-server-17-1/1012144
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service

sudo apt-get -y install qemu-kvm \
    libvirt-bin \
    virt-manager \
    bochs \
    oz \
    libosinfo-bin \
    libguestfs-tools

# Enable user to manage VMs in virtual manager
sudo usermod -a -G libvirt $USER
# Add my user to users group
sudo usermod -a -G users $USER

# Clone set-ups
cd ~
git clone https://github.com/mr6r4y/set-ups
cd set-ups/
./istall-base-dev.sh
./install-tmux.sh
