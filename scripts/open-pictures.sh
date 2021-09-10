#!/bin/zsh

CAMDIR=~/cloud/Photos/Camera
YEARDIR=$(echo $CAMDIR/*(/On[1]))
MONTHDIR=$YEARDIR/*(/On[1])

nomacs $~MONTHDIR
