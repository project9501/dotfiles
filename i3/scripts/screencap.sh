#!/bin/bash

DATE=$(date +"%Y-%m-%d-%H-%M-%S")
CAPDIR=~/pics/screencaps

[ -d $CAPDIR ] || mkdir -p $CAPDIR

scrot $CAPDIR/ss-$DATE.png
