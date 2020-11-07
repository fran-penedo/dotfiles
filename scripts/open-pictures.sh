#!/bin/zsh

CAMDIR=~/cloud/Photos/Camera
YEARDIR=$CAMDIR/$(ls --reverse $CAMDIR | head -n 1)
MONTHDIR=$YEARDIR/$(ls --reverse $YEARDIR | head -n 1)

nomacs $MONTHDIR
