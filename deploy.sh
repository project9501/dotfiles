#!/bin/bash
## Copies existing dotfiles to backup directory and puts symlinks
## to these files in their place
## Also creates a $BIN directory if none exists and moves envsync.sh
## there.
## v1.0 2017-09-07
## v2.0 2017-09-09

DEBUG=false

### ENV

SOURCEDIR=~/.config/dotfiles
BKDIR=~/.config/dotfiles.orig
#FILES=$(ls $SOURCEDIR | grep -v "\.sh")
#FILES=('Xdefaults' 'archey3.cfg' 'bash_aliases' 'bash_logout'\
#		'bash_profile' 'bashrc' 'profile' 'tmux.conf' 'vimrc'\
#		'dircolorsrc')
# Cycling through the dir automatically was a neat idea when we didn't have
# subdirs to contend with, but things got complicated...

FILES="Xdefaults archey3.cfg bash_aliases bash_logout bash_profile bashrc profile\
	tmux.conf vimrc dircolorsrc"
PWD=$(dirname $(readlink -f $0))

#source $PWD/deploy.h

# Debug

$DEBUG && echo $FILES
$DEBUG && echo $PWD
$DEBUG && echo $SOURCEDIR

# Environment sanity

if [ $PWD != $SOURCEDIR ]; then
	[ -d $SOURCEDIR ] || mkdir -p $SOURCEDIR
	cp -Rv * $SOURCEDIR
fi

# Make the backup dir if it doesn't exist

[ -d $BKDIR ] || mkdir -p $BKDIR

# Cycle through all files in repo that aren't scripts or dot files
# If an equivalent dot file exists in the home directory, move it
# Link this file to the dot file in home directory

for file in $FILES; do
	if [ -L ~/.$file ]; then
		continue;
	elif [ -f ~/.$file ]; then
		echo "Moving .$file to $BKDIR..."
		mv ~/.$file $BKDIR/$file.bak.$(date +"%s")
	fi
	echo "Creating symlink to $file in home directory..."
	ln -s $SOURCEDIR/$file ~/.$file
done

# Link other files and dirs

if [ ! -L ~/.vim ]; then
	if [ -d ~/.vim ]; then
		echo "Moving ~/.vim to $BKDIR..."
		mv -n ~/.vim $BKDIR/
	fi
	echo "Creating symlink to .vim in home directory..."
	ln -s $SOURCEDIR/vim ~/.vim
fi

if [ ! -L ~/.config/i3 ]; then
	if [ -d ~/.config/i3 ]; then
		echo "Moving ~/.config/i3 to $BKDIR..."
		mv -n ~/.config/i3 $BKDIR/
	fi
	echo "Creating symlink to i3/ in .config directory..."
	ln -s $SOURCEDIR/i3 ~/.config/i3
fi

if [ ! -L ~/.config/polybar ]; then
	if [ -d ~/.config/polybar ]; then
		echo "Moving ~/.config/polybar to $BKDIR..."
		mv -n ~/.config/polybar $BKDIR/
	fi
	echo "Creating symlink to polybar/ in .config directory..."
	ln -s $SOURCEDIR/polybar ~/.config/polybar
fi

if [ ! -L ~/.config/compton.conf ]; then
	if [ -f ~/.config/compton.conf ]; then
		echo "Moving ~/.config/compton.conf to $BKDIR..."
		mv -n ~/.config/compton.conf $BKDIR/
	fi
	echo "Creating symlink to .config/compton.conf in .config directory..."
	ln -s $SOURCEDIR/compton.conf ~/.config/compton.conf
fi

# Make bin dir if it doesn't exist

[ -d ~/bin ] || mkdir -p ~/bin

# Link envup.sh script to bin if it doesn't exist

[ -f ~/bin/envup.sh ] || ln -s $SOURCEDIR/envup.sh ~/bin/envup.sh
