typeset -U PATH path
path=("$HOME/.local/bin" /other/things/in/path "$path[@]")
export PATH

export EDITOR="nvim"
export RANGER_LOAD_DEFAULT_RC="false"
