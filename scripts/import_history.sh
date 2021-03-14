#!/bin/zsh

ag --depth 0 -g "firefox_history_" | sort | head -n 12 | xargs -P 4 -n 1 sh -c 'archivebox add < "$1"' -
