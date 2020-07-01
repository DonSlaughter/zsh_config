#if [[ "${terminfo[khome]}" != "" ]]; then
#  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
#fi
#if [[ "${terminfo[kend]}" != "" ]]; then
#  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
#fi
#
## start typing + [Up-Arrow] - fuzzy find history forward
#if [[ "${terminfo[kcuu1]}" != "" ]]; then
#  autoload -U up-line-or-beginning-search
#  zle -N up-line-or-beginning-search
#  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
#fi
## start typing + [Down-Arrow] - fuzzy find history backward
#if [[ "${terminfo[kcud1]}" != "" ]]; then
#  autoload -U down-line-or-beginning-search
#  zle -N down-line-or-beginning-search
#  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
#fi
