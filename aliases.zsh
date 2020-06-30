#vim/nvim
alias v="nvim"
alias svim="sudo -E nvim"
## change directory and open files directly in vim
alias zshrc="cd ~/.config/zsh && nvim .zshrc *.zsh"
alias vimrc="cd ~/.vim && nvim vimrc *.vim"
alias nburl="nvim ~/.config/newsboat/urls"

#ask before removing, copying and moving
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"

#exa
#exa is a ls clone which colors the output and the permissions, can show devicons and much more
alias l="exa -l"
alias la="exa -glah --git --icons"
alias ll="exa -lh --git-ignore --icons --git"
alias lt="exa -Tlh --icons --level=3"

#color aliases:
alias ip="ip -color=auto"
alias diff='diff --color=auto'
alias grep='grep --color=auto'

#tmux
alias t="tmux"

#shortcuts for folders
alias uni="cd ~/Documents/BUW"
