#!/bin/bash
rm -f ./nvim
wget -P ./ https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage || exit 1
chmod +x ./nvim.appimage
mv ./nvim.appimage ./nvim
sudo mv ./nvim /usr/local/bin/nvim && echo "Success" || echo "Failed"
