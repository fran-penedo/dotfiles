#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
homedotdir=~
homedir=.
homeconfig="bashrc Xresources emacs emacs-custom.el gitconfig gmrunrc rtorrent.rc xinitrc xmobarrc gitignore gntrc vimrc Rprofile yaourtrc zshrc msmtprc offlineimap.py offlineimaprc tmux.conf tmux.conf.local ctags"
i3dotdir=~/.i3
i3dir=i3
i3config="config i3status.py i3status2.py"
comptondotdir=~/.config
comptondir=config
comptonconfig="compton.conf"
supdotdir=~/.sup
supdir=sup
supconfig="sources.yaml config.yaml colors.yaml hooks"
ncmpcppdir=ncmpcpp
ncmpcppdotdir=~/.ncmpcpp
ncmpcppconfig="config bindings"
mopidydir=config/mopidy
mopidydotdir=~/.config/mopidy
mopidyconfig="mopidy.conf"
catfishdir=config/catfish
catfishdotdir=~/.config/catfish
catfishconfig="catfish.rc"
xmonaddotdir=~/.xmonad
xmonaddir=.
xmonadconfig="xmonad.hs"
rangerdir=config/ranger
rangerdotdir=~/.config/ranger
rangerconfig="rc.conf commands.py"
newsboatdir=newsboat/
newsboatdotdir=~/.newsboat/
newsboatconfig="config urls"


##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

function move {
    mkdir $1
    for file in $2; do
        f=$4$file
        echo "Moving existing config dotfile $f from $1 to $olddir"
        mv $1/$f $olddir
        echo "Creating symlink to $file in $1"
        ln -s $dir/$3/$file $1/$f
    done
}

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
move "$homedotdir" "$homeconfig" "$homedir" .

# move xmonad if needed
move "$xmonaddotdir" "$xmonadconfig" "$xmonaddir"

# move i3config and pystatus scripts if needed
move "$i3dotdir" "$i3config" "$i3dir"

# move sup scripts if needed
move "$supdotdir" "$supconfig" "$supdir"

# move compton if needed
move "$comptondotdir" "$comptonconfig" "$comptondir"

# move mopidy if needed
move "$mopidydotdir" "$mopidyconfig" "$mopidydir"

# move catfish if needed
move "$catfishdotdir" "$catfishconfig" "$catfishdir"

# move ranger if needed
move "$rangerdotdir" "$rangerconfig" "$rangerdir"

# move ncmpcpp if needed
move "$ncmpcppdotdir" "$ncmpcppconfig" "$ncmpcppdir"

# move ncmpcpp if needed
move "$newsboatdotdir" "$newsboatconfig" "$newsboatdir"
