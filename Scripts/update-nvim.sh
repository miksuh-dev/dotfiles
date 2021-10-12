#!/bin/bash

wget -P $HOME/Downloads https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage || exit 1
chmod +x $HOME/Downloads/nvim.appimage || exit 1
mv $HOME/Downloads/nvim.appimage $HOME/Downloads/nvim || exit 1

sudo mv $HOME/Downloads/nvim /usr/local/bin/nvim && echo "Success" || echo "Failed"
