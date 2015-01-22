#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="bashrc Xresources emacs emacs-custom.el gitconfig gmrunrc rtorrent.rc xinitrc xmobarrc gitignore"    # list of files/folders to symlink in homedir
xmonad="xmonad.hs"
i3dotdir=~/.i3
i3dir=i3
i3config="config i3status.py i3status2.py"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# move xmonad if needed
echo "Moving existing xmonad dotfile from ~ to $olddir"
mv ~/.xmonad/$xmonad $olddir
echo "Creating symlink to $xmonad in home/xmonad"
ln -s $dir/$xmonad ~/.xmonad/$xmonad

# move i3config and pystatus scripts if needed
for file in $i3config; do
    echo "Moving existing i3 config dotfile from ~ to $olddir"
    mv $i3dotdir/$file $olddir
    echo "Creating symlink to $i3config in home/.i3"
    ln -s $dir/$i3dir/$file $i3dotdir/$file
done
