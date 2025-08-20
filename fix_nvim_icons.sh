#!/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip -d HackNerdFont

mkdir -p ~/.local/share/fonts

cp HackNerdFont/*.ttf ~/.local/share/fonts/

fc-cache -f -v

PROFILE_ID=$(uuidgen)

dconf write /org/gnome/terminal/legacy/profiles:/list "['$PROFILE_ID']"

dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/visible-name "'Nvim'"

dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/font "'Hack Nerd Font Mono Regular 12'"
