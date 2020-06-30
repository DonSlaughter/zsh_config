export HISTSIZE=100000
export HISTFILE="$HOME/.cache/zsh/histfile"
export SAVEHIST=$HISTSIZE
HISTCMD_LOCAL=0

stty stop undef # Disable ctrl-s to freeze terminal

bindkey -e

# ls colors
autoload -U colors && colors

setopt AUTO_CD                 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash
setopt AUTO_PUSHD              # [default] cd automatically pushes old dir onto dir stack
setopt AUTO_RESUME             # allow simple commands to resume backgrounded jobs
setopt CLOBBER                 # allow clobbering with >, no need to use >!
#setopt CORRECT                 # [default] command auto-correction
#setopt CORRECT_ALL             # [default] argument auto-correction
setopt NO_FLOW_CONTROL         # disable start (C-s) and stop (C-q) characters
setopt NO_HIST_IGNORE_ALL_DUPS # don't filter non-contiguous duplicates from history
setopt HIST_FIND_NO_DUPS       # don't show dupes when searching
setopt HIST_IGNORE_DUPS        # do filter contiguous duplicates from history
setopt HIST_IGNORE_SPACE       # [default] don't record commands starting with a space
setopt HIST_VERIFY             # confirm history expansion (!$, !!, !foo)
setopt IGNORE_EOF              # [default] prevent accidental C-d from exiting shell
setopt INTERACTIVE_COMMENTS    # [default] allow comments, even in interactive shells
setopt LIST_PACKED             # make completion lists more densely packed
setopt MENU_COMPLETE           # auto-insert first possible ambiguous completion
setopt NO_NOMATCH              # [default] unmatched patterns are left unchanged
#setopt PRINT_EXIT_VALUE        # [default] for non-zero exit status
setopt PUSHD_IGNORE_DUPS       # don't push multiple copies of same dir onto stack
setopt PUSHD_SILENT            # [default] don't print dir stack after pushing/popping
setopt SHARE_HISTORY           # share history across shells

autoload -U add-zsh-hook


function -set-tab-and-window-title() {
  emulate -L zsh
  local CMD="${1:gs/$/\\$}"
  print -Pn "\e]0;$CMD:q\a"
}

# Executed before displaying prompt.
function -update-window-title-precmd() {
  emulate -L zsh
  if [[ HISTCMD_LOCAL -eq 0 ]]; then
    # About to display prompt for the first time; nothing interesting to show in
    # the history. Show $PWD.
    -set-tab-and-window-title "$(basename $PWD)"
  else
    local LAST=$(history | tail -1 | awk '{print $2}')
    if [ -n "$TMUX" ]; then
      # Inside tmux, just show the last command: tmux will prefix it with the
      # session name (for context).
      -set-tab-and-window-title "$LAST"
    else
      # Outside tmux, show $PWD (for context) followed by the last command.
      -set-tab-and-window-title "$(basename $PWD) > $LAST"
    fi
  fi
}

add-zsh-hook precmd -update-window-title-precmd

# Executed before executing a command: $2 is one-line (truncated) version of
# the command.
function -update-window-title-preexec() {
  emulate -L zsh
  setopt EXTENDED_GLOB
  HISTCMD_LOCAL=$((++HISTCMD_LOCAL))

  # Skip ENV=settings, sudo, ssh; show first distinctive word of command;
  # mostly stolen from:
  #   https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/termsupport.zsh
  local TRIMMED="${2[(wr)^(*=*|mosh|ssh|sudo)]}"
  if [ -n "$TMUX" ]; then
    # Inside tmux, show the running command: tmux will prefix it with the
    # session name (for context).
    -set-tab-and-window-title "$TRIMMED"
  else
    # Outside tmux, show $PWD (for context) followed by the running command.
    -set-tab-and-window-title "$(basename $PWD) > $TRIMMED"
  fi
}
add-zsh-hook preexec -update-window-title-preexec

typeset -F SECONDS
function -record-start-time() {
  emulate -L zsh
  ZSH_START_TIME=${ZSH_START_TIME:-$SECONDS}
}
add-zsh-hook preexec -record-start-time

function -report-start-time() {
  emulate -L zsh
  if [ $ZSH_START_TIME ]; then
    local DELTA=$(($SECONDS - $ZSH_START_TIME))
    local DAYS=$((~~($DELTA / 86400)))
    local HOURS=$((~~(($DELTA - $DAYS * 86400) / 3600)))
    local MINUTES=$((~~(($DELTA - $DAYS * 86400 - $HOURS * 3600) / 60)))
    local SECS=$(($DELTA - $DAYS * 86400 - $HOURS * 3600 - $MINUTES * 60))
    local ELAPSED=''
    test "$DAYS" != '0' && ELAPSED="${DAYS}d"
    test "$HOURS" != '0' && ELAPSED="${ELAPSED}${HOURS}h"
    test "$MINUTES" != '0' && ELAPSED="${ELAPSED}${MINUTES}m"
    if [ "$ELAPSED" = '' ]; then
      SECS="$(print -f "%.2f" $SECS)s"
    elif [ "$DAYS" != '0' ]; then
      SECS=''
    else
      SECS="$((~~$SECS))s"
    fi
    ELAPSED="${ELAPSED}${SECS}"
    export RPROMPT="%F{cyan}%{$__WINCENT[ITALIC_ON]%}${ELAPSED}%{$__WINCENT[ITALIC_OFF]%}%f $RPROMPT_BASE"
    unset ZSH_START_TIME
  else
    export RPROMPT="$RPROMPT_BASE"
  fi
}
add-zsh-hook precmd -report-start-time


#function -auto-ls-after-cd() {
#  emulate -L zsh
#  # Only in response to a user-initiated `cd`, not indirectly (eg. via another
#  # function).
#  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
#    ls -a
#  fi
#}
#add-zsh-hook chpwd -auto-ls-after-cd
