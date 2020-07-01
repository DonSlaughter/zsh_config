function () {
  # See: `man ls`
  local BLACK=a
  local RED=b
  local GREEN=c
  local BROWN=d
  local BLUE=e
  local MAGENTA=f
  local CYAN=g
  local LIGHT_GRAY=h
  local BOLD_BLACK=A # dark gray
  local BOLD_RED=B
  local BOLD_BROWN=D # yellow
  local BOLD_BLUE=E
  local BOLD_MAGENTA=F
  local BOLD_CYAN=G
  local BOLD_LIGHT_GRAY=H # bright white
  local DEFAULT=x

  # Default is (11 pairs of fg/bg):
  #
  #   exfxcxdxbxegedabagacad
  #   ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
  #   | | | | | | | | | | \
  #   | | | | | | | | | \  - directory (writable, no sticky): black, brown
  #   | | | | | | | | \  --- directory (writable, sticky bit): black, green
  #   | | | | | | | \  ----- executable (setuid): black, cyan
  #   | | | | | | \  ------- executable (setguid): black, red
  #   | | | | | \  --------- character special: blue, brown
  #   | | | | \  ----------- block special: blue, cyan
  #   | | | \  ------------- executable: red, default
  #   | | \  --------------- pipe: brown, defaut
  #   | \  ----------------- socket: green, default
  #   \  ------------------- symbolic link: magenta, default
  #    --------------------- directory: blue, default
  #

  local DIRECTORY="${BOLD_LIGHT_GRAY}${DEFAULT}"
  local SYMBOLIC_LINK="${MAGENTA}${DEFAULT}"
  local SOCKET="${GREEN}${DEFAULT}"
  local PIPE="${BROWN}${DEFAULT}"
  local EXECUTABLE="${BOLD_RED}${DEFAULT}"
  local BLOCK_SPECIAL="${BLUE}${CYAN}"
  local CHARACTER_SPECIAL="${BLUE}${BROWN}"
  local EXECUTABLE_SETGUID="${BLACK}${RED}"
  local EXECUTABLE_SETUID="${BLACK}${CYAN}"
  local DIRECTORY_STICKY="${BLACK}${GREEN}"
  local DIRECTORY_NO_STICKY="${BLACK}${BROWN}"

  LSCOLORS=$DIRECTORY
  LSCOLORS+=$SYMBOLIC_LINK
  LSCOLORS+=$SOCKET
  LSCOLORS+=$PIPE
  LSCOLORS+=$EXECUTABLE
  LSCOLORS+=$BLOCK_SPECIAL
  LSCOLORS+=$CHARACTER_SPECIAL
  LSCOLORS+=$EXECUTABLE_SETGUID
  LSCOLORS+=$EXECUTABLE_SETUID
  LSCOLORS+=$DIRECTORY_STICKY
  LSCOLORS+=$DIRECTORY_NO_STICKY

  export LSCOLORS
}
