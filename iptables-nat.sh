#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/lib/net.sh"
source "$SCRIPT_DIR/config.sh"

usage()
{
    printf "%s\n" "USAGE: iptables-nat.sh NET_FROM INTERFACE" \
        "EXAMPLE: iptables-nat.sh 192.168.100.0 tun0"
}

set -e

if [ ! $1 ] || [ ! $2 ]
then
    usage
else
    iptables_nat_masquerading $1 $2
fi
