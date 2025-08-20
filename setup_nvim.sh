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

# Fix a global node install directory to make mcp happy
sudo mkdir -p /usr/local/lib/node_modules_global
sudo groupadd odoo
# Add your user to the group (and other users as needed)
sudo usermod -a -G odoo $USER
# Change the ownership of the directory to the new group
sudo chown -R root:odoo /usr/local/lib/node_modules_global
# Set the permissions to allow the group to write
sudo chmod -R 775 /usr/local/lib/node_modules_global
