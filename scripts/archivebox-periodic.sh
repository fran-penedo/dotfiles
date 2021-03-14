#!/bin/zsh

last=$(systemctl --user show --property=LastTriggerUSec archivebox-periodic.timer | sed 's/.*=//')
[[ ${last} -eq '0' ]] && last="last month"

/home/fran/dotfiles/scripts/export_browser_history.sh -d 7 -s "${last}" ~/.mozilla/firefox/3exufmp6.default-release/places.sqlite | /home/fran/dotfiles/scripts/filter_links.py | archivebox add
pkill -f 'chromium --headless'
