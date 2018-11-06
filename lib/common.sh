check_sudo()
#@ DESCRIPTION: Exits if executing without root privilages
{
    if [ "$EUID" -ne 0 ]
    then 
        echo "[!] Please run as root"
        exit 1
    fi
}

what_is_myip()
#@ DESCRIPTION: Prints external IP address
{
    echo $(curl -s 'https://api.ipify.org')
}

create_repo_dir()
#@ USAGE: create_repo_dir DIR USER
#@ DESCRIPTION: Creates directory for user source repositories
{
    check_sudo
    if [[ ! -e $1 ]]; then
        echo "[*] Creating $1"
        mkdir $1
        chown $2:$2 $1
    else
        echo "[!] $1 alredy exists"
    fi
}

