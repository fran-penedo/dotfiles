#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export LANG=en_US.UTF-8

xrdb -merge .Xresources

xsetroot -cursor_name left_ptr
xsetroot -solid '#555753'
xset s off
xset b off


#trayer --edge top --align right --SetDockType true --SetPartialStrut true \
# --expand true --width 15 --transparent false --tint 0x000000 --height 18 --monitor 1 &

#~/.scripts/sptrayer.sh &

#xscreensaver -no-splash &

xfce4-power-manager &
nitrogen --restore &
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
#pasystray &
#nm-applet &
#fbxkb &
#dropboxd &
syndaemon -i 1 -t -k &

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
fcitx

export PYMACS_PYTHON=python2
export MC_XDG_OPEN=$HOME/dotfiles/.scripts/xdg-open-spawn

export QT_STYLE_OVERRIDE=Adwaita-Dark

stty -ixon

exec $1
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
