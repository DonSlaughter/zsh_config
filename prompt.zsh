autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

#unicode Arrow
arrow=$'\U276f'

export PROMPT="%B%{$fg[blue]%}%1~%{$fg[red]%} $arrow%b"
export RPROMPT="%{$fg[blue]%}%~"
