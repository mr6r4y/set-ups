#: Title: common.sh
#: Description: Library for common functions

 [ -n "$COMMON_LIB" ] && return || readonly COMMON_LIB=1

check_sudo()
#@ DESCRIPTION: Exits if executing without root privilages
{
    if [ "$EUID" -ne 0 ]
    then 
        echo "[!] Please run as root"
        exit 1
    fi
}

create_repo_dir()
#@ USAGE: create_repo_dir DIR USER
#@ DESCRIPTION: Creates directory for user source repositories
{
    if [[ -e $1 ]]; then
        echo "[!] $1 alredy exists"
        return
    fi
    
    echo "[*] create_repo_dir $1"
    sudo mkdir $1
    sudo chown $2:$2 $1
}

