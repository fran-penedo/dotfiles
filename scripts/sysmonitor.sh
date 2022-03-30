#!/bin/zsh

set -euo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

systemd_user_units=(archivebox-server archivebox-history nextcloud-backups tube-archive ytmusic poll-mail mail-rssify)
systemd_units=(openvpn-client@vpn-local openvpn-client@vpn-all-traffic)
ping_targets=(franpenedo.com fserver)
http_targets=(https://franpenedo.com https://cloud.franpenedo.com)

ERROR_WORDS=(failed unknown 404 503 500)

# If you need to cd to the script directory:
# script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
    cat <<EOF
Usage: $(basename "${ZSH_ARGZERO}") [-h] [-v] [--color/--no-color]

Monitors several resources.

Keep running with:

watch --color -t -n60 $(basename "${ZSH_ARGZERO}") --color

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
    --color     Force colors
EOF
    exit
}

cleanup() {
    trap - SIGINT SIGTERM ERR EXIT
    # script cleanup here
}

setup_colors() {
    if [[ -n "${FORCE_COLOR-}" ]] || [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
        NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
    else
        NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
    fi
}

msg() {
    echo >&2 -e "${1-}"
}

die() {
    local msg=$1
    local code=${2-1} # default exit status 1
    msg "$msg"
    exit "$code"
}

parse_params() {
    # default values of variables set from params
    flag=0
    param=''

    while :; do
        case "${1-}" in
            -h | --help) usage ;;
            -v | --verbose) set -x ;;
            --no-color) NO_COLOR=1 ;;
            --color) FORCE_COLOR=1 ;;
            # -f | --flag) flag=1 ;; # example flag
            # -p | --param) # example named parameter
                # param="${2-}"
                # shift
                # ;;
            -?*) die "Unknown option: $1" ;;
            *) break ;;
        esac
        shift
    done

    args=("$@")

    # check required params and arguments
    # [[ -z "${param-}" ]] && die "Missing required parameter: param"
    # [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

    return 0
}

parse_params "$@"
setup_colors

# script logic here

function get_systemd_unit_status {
    local user=${2-}
    systemctl $user status $1 &>/dev/null && rc=$? || rc=$?
    if [ $rc -eq 4 ]; then
        die "Unit $1 could not be found"
    fi

    systemctl $user show $1 |
        ag ActiveState |
        sed 's/.*=//' |
        cat
}

function get_ping_status {
    ping -q -c 1 -W 2 $1 &> /dev/null && rc=$? || rc=$?
    if [ $rc -eq 1 ]; then
        echo "failed"
    elif [ $rc -eq 2 ]; then
        echo "unknown"
    else
        echo "active"
    fi
}

function get_http_status {
    curl -s -o /dev/null --head -w "%{http_code}" -X POST "$1" && rc=$? || rc=$?
}

function print_status {
    if (( ${ERROR_WORDS[(I)${2}]} )); then
        local COLOR=${RED}
    else
        local COLOR=${GREEN}
    fi
    printf "${COLOR}%-12s %-15s %s\n${NOFORMAT}" "[$2]" "$3" "$1"
}

for unit in $systemd_user_units; do
    print_status $unit $(get_systemd_unit_status $unit "--user") "systemd-user"
done

for unit in $systemd_units; do
    print_status $unit $(get_systemd_unit_status $unit) "systemd"
done

for target in $ping_targets; do
    print_status $target $(get_ping_status $target) "ping"
done

for target in $http_targets; do
    print_status $target $(get_http_status $target) "http"
done

