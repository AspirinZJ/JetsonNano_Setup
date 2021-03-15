#!/bin/bash

sudo apt remove -y xarchiver

rm ~/.config/user-dirs.dirs && cp user-dirs.dirs ~/.config/

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup component add rls rust-analysis rust-src

echo "Installing SpaceVim, run `curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall` to uninstall"

curl -sLf https://spacevim.org/install.sh | bash
vim
vim

cd ~
git clone git@github.com:AspirinZJ/SpaceVim_settings.git

if [ ! -f /~/.SpaceVim.d/init.toml ]; then
	rm ~/.SpaceVim.d/init.toml
fi

cp ./SpaceVim_settings/init.toml ~/.SpaceVim.d/
