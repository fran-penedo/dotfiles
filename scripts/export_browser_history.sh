#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

# If you need to cd to the script directory:
# script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-b] [-d days] [-s since] db_file

Exports firefox history located at db_file (point to places.sqlite).

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
-d, --days      Max number of days of history to export
-s, --since     Export since this date. Will not export more than -d days of history
-b, --bookmarks Export bookmarks instead
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
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
    -b | --bookmarks) bookmarks=1 ;;
    -d | --days)
      days="${2-}"
      shift
      ;;
    -s | --since)
        since="${2-}"
        shift
        ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  # [[ -z "${param-}" ]] && die "Missing required parameter: param"
  [[ ${#args[@]} -ne 1 ]] && die "Missing required argument: db_file"

  return 0
}

parse_params "$@"
setup_colors

# script logic here
db_file=${args[0]}
tmp_file="/tmp/firefox_history.db.tmp"

cp "${db_file}" "${tmp_file}"

START_DATE_QUERY=${days:+"last_visit_date > strftime('%s', datetime('now', '-${days} day')) * 1000000"}
SINCE_DATE_QUERY=${since:+"last_visit_date > strftime('%s', '$(date --date="${since}" '+%Y-%m-%d %H:%m%:z')') * 1000000"}
[[ -n ${START_DATE_QUERY} ]] && [[ -n ${SINCE_DATE_QUERY} ]] && AND=" AND " || AND=""
DATE_QUERY="${START_DATE_QUERY}${AND}${SINCE_DATE_QUERY}"
WHERE_QUERY=${DATE_QUERY:+"WHERE ${DATE_QUERY}"}

if [[ -z ${bookmarks:-} ]]; then
    sqlite3 "${tmp_file}" "SELECT \"[\" || group_concat(json_object('timestamp', last_visit_date, 'description', title, 'href', url)) || \"]\" FROM moz_places ${WHERE_QUERY};"
else
    sqlite3 "${tmp_file}" "SELECT \"[\" || group_concat(json_object('timestamp', b.dateAdded, 'description', b.title, 'href', f.url)) || \"]\" FROM moz_bookmarks AS b JOIN moz_places AS f ON f.id = b.fk"
fi

rm "${tmp_file}"
