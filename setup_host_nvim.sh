#!/bin/bash

NVIM=$HOME/.config/nvim

# Snap installing neovim 
sudo snap install nvim --classic

# Installing luarocks dependencys and more
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    lua5.1 liblua5.1-dev liblua5.1-0-dev unzip ripgrep mercurial build-essential wl-clipboard

# setup tree-sitter
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
cargo install tree-sitter-cli

# Seting up and installing luarocks
cd /tmp
wget -O /tmp/luarocks.tar.gz https://luarocks.org/releases/luarocks-3.12.2.tar.gz
tar zxpf luarocks.tar.gz
cd /tmp/luarocks-3.12.2/
./configure && make && sudo make install
sudo luarocks install luasocket
sudo rm ../luarocks* -r
cd $USER_LOCATION

mkdir $HOME/.config
mkdir $NVIM
mkdir $NVIM/mcphub
mkdir $NVIM/lua
mkdir $NVIM/lua/config
mkdir $NVIM/lua/plugins
mkdir $NVIM/lua/themes

wget -O $NVIM/init.lua https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/nvim/init.lua
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
sudo chown -R $USER:$USER /usr/local/lib/node_modules_global
sudo npm config set prefix /usr/local/lib/node_modules_global --global
echo -e '\nexport PATH="/usr/local/lib/node_modules_global/bin:$PATH"\nexport PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
. ~/.bashrc
