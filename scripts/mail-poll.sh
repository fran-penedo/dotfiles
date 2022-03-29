#!/usr/bin/env bash

ulimit -c 0

exec 9>/tmp/mail-poll.lock
if ! flock -w 30 9; then
   printf 'Another instance is running for a long time\n';
   exit 1
fi

astroid --start-polling

if [[ "$1" == "-a" ]]; then
    /home/fran/dotfiles/scripts/maildir-notmuch-sync pre /home/fran/mail/personal
fi

mbsync "$@"
/home/fran/dotfiles/scripts/maildir-notmuch-sync post /home/fran/mail/personal

astroid --stop-polling

exit 0
