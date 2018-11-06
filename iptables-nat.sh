#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"
source "$SCRIPT_DIR/config.sh"

usage()
{
    printf "%s\n" "USAGE: iptables-nat.sh <NET-TO-BE-FORWARDED>" \
        "EXAMPLE: iptables-nat.sh 192.168.100.0"
}

main()
{
    check_sudo

    bash -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
    bash -c 'echo 1 > /proc/sys/net/ipv4/ip_dynaddr'

    iptables -t nat -A POSTROUTING -d 0/0 -s $1/24 -j MASQUERADE
    iptables -A FORWARD -s $1/24 -d 0/0 -j ACCEPT
    iptables -A FORWARD -s 0/0 -d $1/24 -j ACCEPT    
}

if [ ! $1 ]
then
    usage
else
    main
fi
