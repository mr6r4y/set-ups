# Set-ups

Scripts and common configurations for setting up VMs from scratch and administration.

## Scripts

### install-base-dev.sh

#### Usage

    ./install-base-dev.sh

#### Description

Installs:

* build-essentials
* curl
* python2.7-dev
* python3.6-dev
* python-pip
* ruby
* golang

### install-webauto.sh

#### Usage

    ./install-webauto.sh

#### Description

Installs:

* google-chrome
* chromedriver
* python-selenium
* configures chrome and firefox profiles in a custom directory

### install-netsec.sh

#### Usage

    ./install-netsec.sh

#### Description

Installs:

* SecLists
* dnscan
* gobuster
* wpscan (gem)

**TO-DO:**

* virtual-host-discovery

### install-wpscan.sh

#### Usage

    ./install-wpscan.sh

#### Description

Installs `wpscan` from sources

### install-free-proxies.sh

#### Usage

    ./install-free-proxies.sh

#### Description

Installs Burp Community and OWASP ZAP

### install-tmux.sh

#### Usage

    ./install-tmux.sh

#### Description

Install `tmux` with conigurations and plugins seen at [IppSec's video tutorial](https://www.youtube.com/watch?v=Lqehvpe_djs)

### install-cracking-tools.sh

#### Usage

    ./install-cracking-tools.sh

#### Description

Installs and configures:

* hashcat
* hydra
* john
* medusa
* ncrack

### install-metasploit.sh

#### Usage

    ./install-metasploit.sh

#### Description

Installs and configures [metasploit-framework](https://github.com/rapid7/metasploit-framework) as described in [Setting Up a Metasploit Development Environment](https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Development-Environment)

### install-exploitdb.sh

#### Usage

    ./install-exploitdb.sh

#### Description

Clones [exploitdb](https://github.com/offensive-security/exploitdb.git) and links `searchsploit` to be in `PATH`.

### iptables-nat.sh

#### Usage

    ./iptables-nat.sh NET_FROM INTERFACE

#### Example

    ./iptables-nat.sh 192.168.10.0 tun0

#### Description

Makes the machine forward traffic from the `NET_FROM` to everything connected to device `tun0`. It is convinient to use it when make a VPN connection on e VM and want that VM to forward traffic to the tunneled network.

### install-bundle.sh

#### Usage

    wget https://raw.githubusercontent.com/mr6r4y/set-ups/master/install-bundle.sh && bash ./install-bundle.sh

#### Description

Bootstrap script and intallation of:

* install-base-dev.sh
* install-tmux.sh
* install-webauto.sh
* install-exploitdb.sh
* install-netsec.sh
* install-free-proxies.sh

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
* smbclient

### Password Cracking

* hashcat
* hashcat-utils
* pack-0.0.4
* hydra
* medusa
* ncrack

### Other

* ttygif
* tmux-logging
* codequery
