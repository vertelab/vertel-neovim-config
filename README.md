# vertel-nvim-config

## Install on host
Run the command below to set up nvim on a host/your machine.
```
sudo wget -O- https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/setup_host_nvim.sh | bash
```
## Install on server
Run the command below to set up nvim on a server.
```
sudo wget -O- https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/setup_server_nvim.sh | bash
```

## Fix missing icons
A lot of Neovim plugins use Nerd fonts. If you don't have such a font, you will see square boxes. To fix this, you can run the script below on your host machine. The script will download a Nerd Font and apply it to your GNOME Terminal.
```
sudo wget -O- https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/fix_nvim_icons.sh | bash
```
