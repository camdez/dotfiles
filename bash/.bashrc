# ~/.bashrc: configuration file for interactive bash(1) shells

[ -f /etc/bashrc ] && . /etc/bashrc # Source global definitions
[[ $- != *i* ]]    && return        # Do nothing if this is not an interactive shell

[ -f "$HOME/.shared_rc" ] && . "$HOME/.shared_rc"

# Git completion
[ -f "$HOME/.git_completion.sh" ] && . "$HOME/.git_completion.sh"

# Save these so we can check against them in later prompts
export __NORMAL_USER=$USER
export __NORMAL_HOST=$HOSTNAME

function __make_prompt() {
  # This has to come first
  local RET=$?

  # Only set these colors if we are on a color terminal
  case $TERM in
    xterm*|rxvt|vt100|screen)
      local PROMPT_COLOR=$COLOR_GREEN
      local WARN_COLOR=$COLOR_RED
      local CLEAR_COLOR=$COLOR_DEFAULT
      ;;
  esac

  if [ $RET -ne 0 ]; then
    local FACE_PART="${WARN_COLOR}:(${CLEAR_COLOR}\n"
  fi

  if [ $USER != $__NORMAL_USER ]; then
    local PROMPT_USER_PART='\u'
  fi

  if [ `hostname` != $__NORMAL_HOST ]; then
    local PROMPT_HOST_PART='@\h '
  fi

  if [ -n "${PROMPT_USER_PART}" ] || [ -n "${PROMPT_HOST_PART}" ]; then
    local OPTIONAL_SPACE=' '
  fi

  # Uses Shawn O. Pearce's .git_completion.sh (loaded in .bash_profile)
  type "__git_ps1" &> /dev/null
  if [ $? -eq 0 ]; then
    local GIT_PART=`__git_ps1 ":%s"`
  fi

  # Non-printing chars must be surrounded by \[ and \] to tell bash that
  # they don't take up any space.  Otherwise wrapping will be whacked.
  PS1="${FACE_PART}\[${PROMPT_COLOR}\][${PROMPT_USER_PART}${PROMPT_HOST_PART}${OPTIONAL_SPACE}\W${GIT_PART}]\[${CLEAR_COLOR}\] "
}

# XXX Pass this function down to child processes, otherwise new shells opened
# will get the PROMPT_COMMAND but not the function necessary to make it work.
export PROMPT_COMMAND='__make_prompt'
export -f __make_prompt
