#PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%b${NEWLINE}$"
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

#unicode Arrow
arrow=$'\U276f'

export PROMPT="%B%{$fg[blue]%}%1~%{$fg[red]%} $arrow%b"
export RPROMPT="%~"
