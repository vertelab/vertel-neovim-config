#!/bin/bash

USER_LOCATION=$(pwd)

# snap installing neovim 
sudo snap install nvim

# installing luarocks dependencys
sudo apt install lua5.1  liblua5.1-dev unzip

# seting up and installing luarocks
wget -O /tmp/luarocks.tar.gz https://luarocks.org/releases/luarocks-3.12.2.tar.gz
tar zxpf luarocks.tar.gz
cd /tmp/luarocks/
./configure && make && sudo make install
sudo luarocks install luasocket
cd $USER_LOCATION

# setting up global neovim config
mkdir /etc/xdg/nvim
mkdir /etc/xdg/nvim/lua
mkdir /etc/xdg/nvim/lua/config
mkdir /etc/xdg/nvim/lua/plugins
