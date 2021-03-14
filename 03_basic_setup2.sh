#!/bin/bash

rm ~/.config/user-dirs.dirs && cp user-dirs.dirs ~/.config/

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
