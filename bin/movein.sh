#!/bin/bash

# movein.sh - install personal dotfile collection

if [ $0 != "bin/movein.sh" ]; then
    echo "This file is meant to be run as bin/movein.sh (from the dotfile directory).";
    exit 1;
fi

if [ $# -ne 0 ]; then
    echo "Usage: $0";
    exit 1;
fi


## Commands to install various dotfiles:
# bash
bin/dotfile_install.sh dot-bash_profile         # a basic dotfile installation
bin/dotfile_install.sh dot-bashrc

# zsh
bin/dotfile_install.sh dot-zshrc

bin/dotfile_install.sh dot-shared_rc

# emacs
bin/dotfile_install.sh dot-emacs.d

# git
bin/dotfile_install.sh dot-gitconfig
bin/dotfile_install.sh dot-gitignore

# nethack
bin/dotfile_install.sh dot-nethackrc

# tmux
bin/dotfile_install.sh tmux.conf
# wget
bin/dotfile_install.sh dot-wgetrc

# X11
bin/dotfile_install.sh dot-Xdefaults

# ack
bin/dotfile_install.sh dot-ackrc

# RSpec
bin/dotfile_install.sh dot-rspec
