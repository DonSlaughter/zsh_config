#vim/nvim
alias v="nvim"
alias svim="sudo -E nvim"
## change directory and open files directly in vim
alias zshconf="cd ~/.config/zsh && nvim .zshrc *.zsh"
alias vimconf="cd ~/.vim && nvim vimrc *.vim"

#ask before removing, copying and moving
#and show  result
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"

#exa
#exa is a ls clone which colors the output and the permissions, can show devicons and much more
#wrapper to check if exa is installed
if ! command -v exa &> /dev/null
then
	alias l="ls -alF"
	alias la="ls -la"
	alias ll="ls -l"
else
	alias ls="exa"
	alias l="exa -l"
	alias la="exa -glah --git --icons"
	alias ll="exa -lh --git-ignore --icons --git"
	alias lt="exa -Tlh --icons --level=3"
fi

#color aliases:
alias ip="ip -color=auto"
alias diff='diff --color=auto'
alias grep='grep --color=auto'

#tmux
alias t="tmux"

#newsboat
alias nb="newsboat"
alias nburl="cd ~/.config/newsboat/ && nvim ~/.config/newsboat/urls"

#Navigation
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
#shortcuts for folders
alias uni="cd ~/Documents/BUW"
alias todo="nvim ~/todo.txt"
