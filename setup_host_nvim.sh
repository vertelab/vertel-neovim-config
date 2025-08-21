NVIM=/home/$USER/.config/nvim
mkdir /home/$USER/.config
mkdir $NVIM
mkdir $NVIM/mcphub
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
