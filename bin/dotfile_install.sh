#!/bin/bash

# This script takes a dotfile as an argument and links it into $HOME/.
# If applicable it will strip off a "dot-" prefix and replace it with
# ".".

if [ $# -ne 1 ]; then
    echo "Usage: $0 dotfile";
    exit 1;
fi

if [ ! -e `pwd`/$1 ]; then
    echo "`pwd`/$1 does not exist.  Exiting.";
    exit 1;
fi

PROPER_NAME=`echo $1 | sed 's/^dot-/./'`;

if [ -h $HOME/$PROPER_NAME ]; then
    echo "$HOME/$PROPER_NAME is a symlink.  Removing.";
    rm $HOME/$PROPER_NAME;
elif [ -f $HOME/$PROPER_NAME ]; then
    echo "$HOME/$PROPER_NAME already exists.  Diverting to $HOME/$PROPER_NAME.old";
    mv $HOME/$PROPER_NAME $HOME/$PROPER_NAME.old;
elif [ -d $HOME/$PROPER_NAME ]; then
    echo "$HOME/$PROPER_NAME directory already exists.  Diverting to $HOME/$PROPER_NAME.old";
    mv $HOME/$PROPER_NAME $HOME/$PROPER_NAME.old;
elif [ -e $HOME/$PROPER_NAME ]; then
    echo "$HOME/$PROPER_NAME exists but is not a symlink or a regular file.";
    echo "Please remove it manually and rerun this script.";
    exit 1;
fi

echo "Linking $HOME/$PROPER_NAME to `pwd`/$1.";
ln -s `pwd`/$1 $HOME/$PROPER_NAME;

