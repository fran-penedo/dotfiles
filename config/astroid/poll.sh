#!/usr/bin/env bash
#
# poll.sh - An example poll script for astroid.
#
# Intended to be run by astroid. See the following link for more information:
# https://github.com/astroidmail/astroid/wiki/Polling
#
# In particular, in order for this script to be run by astroid, it needs to be
# located at ~/.config/astroid/poll.sh
#

# Exit as soon as one of the commands fail.
set -e

SCRIPTS=/home/fran/dotfiles/scripts

# Fetch new mail.
$SCRIPTS/maildir-notmuch-sync pre /home/fran/mail/personal
mbsync -a
$SCRIPTS/maildir-notmuch-sync post /home/fran/mail/personal

# Import new mail into the notmuch database.
# notmuch new

# Here you can process the mail in any way you see fit. See the following link
# for examples:
# https://github.com/astroidmail/astroid/wiki/Processing-mail
