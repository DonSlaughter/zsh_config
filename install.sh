#!/bin/bash

#creates an .zshenv file in /home/user
echo "creating a .zshenv in /home/\$USER/"
echo "export ZDOTDIR=\$HOME/.config/zsh" >> ~/.zshenv

#moving cloned folders to ~/.config/zsh to clean up the home directory
location=$(pwd)
cd ~
mv . /home/\$USER/.config/zsh/
rmdir $location
cd /home/\$USER/.config/zsh
