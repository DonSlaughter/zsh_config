#vim/nvim
alias v="nvim"
alias svim="sudo -E nvim"
## change directory and open files directly in vim
alias zshconf="cd ~/.config/zsh && nvim .zshrc *.zsh"
alias vimconf="cd ~/.vim && nvim vimrc *.vim ./lspconfig/*"

#ask before removing, copying and moving
#and show  result
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -vp"

#exa
#exa is a ls clone which colors the output and the permissions, can show devicons and much more
#wrapper to check if exa is installed
if ! command -v eza &> /dev/null
then
	alias l="ls -alF"
	alias la="ls -la"
	alias ll="ls -l"
else
	alias ls="eza --group-directories-first --time-style=long-iso"
	alias l="eza -l --group-directories-first --time-style=long-iso"
	alias la="eza -glah --git --icons --group-directories-first --time-style=long-iso"
	alias ll="eza -lh --icons --git --group-directories-first --time-style=long-iso"
	alias lt="eza -Tlh --icons --level=3 --group-directories-first --time-style=long-iso"
fi

#color aliases:
alias ip="ip -color=auto"
alias diff='diff --color=auto'
alias grep='grep --color=auto'

#tmux
alias t="tmux -f ~/.config/tmux/tmux.conf"

#newsboat
alias nb="newsboat"
alias nburl="cd ~/.config/newsboat/ && nvim ~/.config/newsboat/urls"

#Navigation
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit -v"
alias gco="git checkout"
alias gd="git diff"
alias gs="git status"
alias gsb="git status -sb"

alias yayfind="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"
