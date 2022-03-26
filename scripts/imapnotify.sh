#!/usr/bin/env bash

astroid --start-polling
mbsync sync-fastmail-inbox
/home/fran/dotfiles/scripts/maildir-notmuch-sync post /home/fran/mail/personal
astroid --stop-polling
