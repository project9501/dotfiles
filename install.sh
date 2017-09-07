#!/bin/bash
## Copies existing dotfiles to backup directory and puts symlinks
## to these files in their place
## Also creates a $BIN directory if none exists and moves envsync.sh
## there.
## v1.0 2017-09-07

### ENV

SOURCEDIR=~/.config/dotfiles
BKDIR=~/.config/dotfiles.orig
FILES=$(ls $SOURCEDIR | grep -v "\.sh")

# Make the backup dir if it doesn't exist

[ -d $BKDIR ] || mkdir -p $BKDIR

# Cycle through all files in repo that aren't scripts or dot files
# If an equivalent dot file exists in the home directory, move it
# Link this file to the dot file in home directory

for file in $FILES; do
	if [ -f ~/.$file ]; then
		echo "Moving .$file to $BKDIR..."
		mv ~/.$file $BKDIR/
	fi
	echo "Creating symlink to $file in home directory..."
	ln -s $SOURCEDIR/$file ~/.$file
done

