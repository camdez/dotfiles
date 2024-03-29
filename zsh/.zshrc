[ -f "$HOME/.shared_rc" ] && . "$HOME/.shared_rc"

[ -d ~/bin ] && export PATH="$HOME/bin:$PATH" # Add ~/bin to $PATH if it exists

export PATH="/usr/local/bin:$HOME/bin:$PATH"
export PATH="/usr/local/Cellar/cask/0.7.2/bin:${PATH}"

# Environment variables
#export EDITOR="$HOME/bin/emacs"
export EDITOR="e"
export VISUAL=$EDITOR
export PAGER='less'

autoload -U colors && colors
setopt prompt_subst

function _git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "±${ref#refs/heads/}"
}

PROMPT='%{${fg[green]}%}[%1~$(_git_prompt_info)]%{${reset_color}%} '

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Completion
autoload -U compinit
compinit -i

fpath=(~/bin/zsh_functions $fpath)
autoload -U ~/bin/zsh_functions/*(:t)

autoload -Uz git-escape-magic
git-escape-magic

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# (setq sh-basic-offset 2)

# # Testing
# autoload -U select-word-style
# select-word-style bash

# # TODO these functions sound generic but actually aren't since they
# # change the word-style.

# backward-argument() {
#   select-word-style shell
#   backward-word-match
#   select-word-style bash
# }

# forward-argument() {
#   select-word-style shell
#   forward-word-match
#   select-word-style bash
# }

ALT_WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
export WORDCHARS=''

backward-argument() {
  local WORDCHARS=$ALT_WORDCHARS
  zle backward-word
}

forward-argument() {
  local WORDCHARS=$ALT_WORDCHARS
  zle forward-word
}

# Define as widgets
zle -N backward-argument
zle -N forward-argument

# Bind to Option-Left & Option-Right
bindkey '^[^[[D' backward-argument
bindkey '^[^[[C' forward-argument

# TODO forward, kill, transpose

# Local Variables:
# mode: sh
# End:
