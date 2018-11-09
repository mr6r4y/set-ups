# Set-ups

Scripts and common configurations for setting up VMs from scratch and administration.

## Scripts

### install-base-dev.sh

**TO-DO**

* python2.7-dev
* python3.6-dev

### install-base-netsec.sh

**TO-DO**

* nmap
* dnscan
* dirsearch
* gobuster
* virtual-host-discovery

## install-tmux.sh

### Usage

    ./install-tmux.sh

### Description

Install `tmux` with conigurations and plugins seen at [IppSec's video tutorial](https://www.youtube.com/watch?v=Lqehvpe_djs)

## install-metasploit.sh

### Usage

    ./install-metasploit.sh

### Description

Installs and configures [metasploit-framework](https://github.com/rapid7/metasploit-framework) as described in [Setting Up a Metasploit Development Environment](https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Development-Environment)

## install-exploitdb.sh

### Usage

    ./install-exploitdb.sh

### Description

Clones [exploitdb](https://github.com/offensive-security/exploitdb.git) and links `searchsploit` to be in `PATH`.

## iptables-nat.sh

### Usage

    ./iptables-nat.sh NET_FROM INTERFACE

### Example
    
    ./iptables-nat.sh 192.168.10.0 tun0

### Description

Makes the machine forward traffic from the `NET_FROM` to everything connected to device `tun0`. It is convinient to use it when make a VPN connection on e VM and want that VM to forward traffic to the tunneled network.

## Tools

### RE + Exploit Development

* nasm
* vasm
* radare2
* cutter
* gdb-multiarch
* gdbserver
* gdb + gef + gef-extras
* unicorn
* libheap
* miasm
* binwalk
* capstone
* z3
* libxdisasm

#### ROP

* ropeme
* xrop

### OSINT

* recon-ng

### Network Security Testing

* metasploit
* vulnscan
* routersploit
* dirsearch
* dnscan
* gobuster
* dtpscan
* knock
* vlan-hopping
* yersinia
* virtual-host-discovery
* tshark
* tcpdump
* searchsploit

### Password Cracking

* hashcat
* hashcat-utils
* pack-0.0.4

### Other

* ttygif
* tmux-logging
* codequery
