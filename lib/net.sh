#: Title: net.sh
#: Description: Library for network related configurations and actions

[ -n "$NET_LIB" ] && return || readonly NET_LIB=1

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

source "$SCRIPT_DIR/lib/common.sh"

add_route()
#@ USAGE: add_route NET GATEWAY
{
    if [ ! $1 ] || [ ! $2 ]
    then
        echo "[!] add_route - usage: add_route NET GATEWAY"
        return 1
    fi

    echo "[*] add_route $1 $2"

    sudo ip route add $1/24 via $2
}

what_is_my_ip()
#@ DESCRIPTION: Prints external IP address
{
    echo $(curl -s 'https://api.ipify.org')
}

iptables_nat_masquerading()
#@ USAGE: iptables_nat_masquerading NET_FROM INTERFACE
#@ EXAMPLE: iptables_nat_masquerading 192.168.100.0 tun0
#@ REF: https://help.ubuntu.com/lts/serverguide/firewall.html.en
#@ DESCRIPTION: Simple rule that makes the machine NATing the
#@              traffic between the NET_FROM through INTERFACE.
#@              The scirpt flushes iptables.
{
    if [ ! $1 ] || [ ! $2 ]
    then
        echo "[!] iptables_nat_masquerading - usage: iptables_nat_masquerading NET_FROM INTERFACE"
        return 1
    fi

    echo "[*] iptables_nat_masquerading $1 $2"

    sudo bash -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
    sudo bash -c 'echo 1 > /proc/sys/net/ipv4/ip_dynaddr'

    sudo iptables --flush

    sudo iptables -t nat -A POSTROUTING -s $1/16 -o $2 -j MASQUERADE    
}
