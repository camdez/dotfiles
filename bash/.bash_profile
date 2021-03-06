# ~/.bash_profile: executed by bash(1) each time a login shell is started.

[ -f /etc/profile ] && . /etc/profile # include system-wide .profile if it exists
[ -f ~/.bashrc ]    && . ~/.bashrc    # include .bashrc if it exists

[ -d ~/bin ] && export PATH="$HOME/bin:$PATH" # Add ~/bin to $PATH if it exists
[ -d /Applications/Emacs.app/Contents/MacOS/bin ] && export PATH="/Applications/Emacs.app/Contents/MacOS/bin/:$PATH"

# Environment variables
export EDITOR='emacs'
export VISUAL=$EDITOR
export PAGER='less'

# No sad faces, even if above fails (see .bashrc)
true
