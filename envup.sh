#!/bin/bash

[ -z $1 ] && { echo "This script requires a commit reason."; exit 0; }

cd ~/.config/dotfiles
git add *
git commit -m $1
git push -u origin master

