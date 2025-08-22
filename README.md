# vertel-nvim-config

## Install on host
Run the command below to set up nvim on a host/your machine.
```
sudo wget -O- https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/setup_host_nvim.sh | bash
```
## Install on server
Note: Make sure you are part of the group odoo before you run the setup script for servers. The script will add you to the group, but it will not take effect until you have restarted the terminal session. If you have already run the script and it didn't work properly, try exiting your terminal session, starting a new one, and running the script again.
```
sudo groupadd odoo
```
```
sudo usermod -a -G odoo $USER
```
Run the command below to set up nvim on a server.
 
```
sudo wget -O- https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/setup_server_nvim.sh | bash
```

## Fix missing icons
A lot of Neovim plugins use Nerd fonts. If you don't have such a font, you will see square boxes. To fix this, you can run the script below on your host machine. The script will download a Nerd Font and apply it to your GNOME Terminal.
```
sudo wget -O- https://github.com/vertelab/vertel-neovim-config/raw/refs/heads/main/fix_nvim_icons.sh | bash
```
