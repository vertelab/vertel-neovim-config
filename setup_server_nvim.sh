#!/bin/bash

USER_LOCATION=$(pwd)
NVIM=/etc/xdg/nvim

# snap installing neovim 
sudo snap install nvim --classic

# installing luarocks dependencys and more
sudo apt-get update
sudo apt-get install lua5.1 liblua5.1-dev unzip npm ripgrep tree-sitter mercurial

# Installing python dependencys
sudo pip install mcp-hub

# seting up and installing luarocks
wget -O /tmp/luarocks.tar.gz https://luarocks.org/releases/luarocks-3.12.2.tar.gz
tar zxpf luarocks.tar.gz
cd /tmp/luarocks-3.12.2/
./configure && make && sudo make install
sudo luarocks install luasocket
sudo rm luarocks* -r
cd $USER_LOCATION

sudo groupadd odoo
# Add your user to the group (and other users as needed)
sudo usermod -a -G odoo $USER

# setting up global neovim config
sudo mkdir $NVIM
sudo chown root:odoo $NVIM
sudo chmod g+rwx $NVIM
mkdir $NVIM/mcphub
mkdir $NVIM/lua
mkdir $NVIM/lua/config
mkdir $NVIM/lua/plugins
mkdir $NVIM/lua/themes

# get nvim files
wget -O $NVIM/init.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/init.lua
wget -O $NVIM/sysinit.vim https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/sysinit.vim
wget -O $NVIM/mcphub/servers.json https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/mcphub/servers.json
wget -O $NVIM/lua/config/lazy.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/config/lazy.lua
wget -O $NVIM/lua/plugins/codecompanion.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/codecompanion.lua
wget -O $NVIM/lua/plugins/comment.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/comment.lua
wget -O $NVIM/lua/plugins/diffview.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/diffview.lua
wget -O $NVIM/lua/plugins/harpoon.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/harpoon.lua
wget -O $NVIM/lua/plugins/lsp.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/lsp.lua
wget -O $NVIM/lua/plugins/mason.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/mason.lua
wget -O $NVIM/lua/plugins/mcphub.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/mcphub.lua
wget -O $NVIM/lua/plugins/telescope.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/telescope.lua
wget -O $NVIM/lua/plugins/which-key.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/plugins/which-key.lua
wget -O $NVIM/lua/themes/init.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/lua/themes/init.lua

# Fix a global node install directory to make mcp happy
sudo mkdir -p /usr/local/lib/node_modules_global
# Change the ownership of the directory to the new group
sudo chown -R root:odoo /usr/local/lib/node_modules_global
# Set the permissions to allow the group to write
sudo chmod -R 775 /usr/local/lib/node_modules_global
sudo npm config set prefix /usr/local/lib/node_modules_global --global
sudo wget -O /etc/profile.d/set_global_node_dir.sh https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/set_global_node_dir.sh

