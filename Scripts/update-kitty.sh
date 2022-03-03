#!/bin/bash

url=$(curl -s https://api.github.com/repos/kovidgoyal/kitty/releases/latest \
| jq '.assets[]  | select(.label == "Linux x86 binary bundle") | .browser_download_url' \
| tr -d '"')

wget -P /tmp -O /tmp/kitty-latest.txz $url || exit 1
echo 'Downloaded newest version'

rm -rf /tmp/kitty  || exit 1
mkdir /tmp/kitty  || exit 1
echo 'Createed tmp folder'
tar xf /tmp/kitty-latest.txz -C /tmp/kitty
echo 'Extracted kitty to tmp folder'


echo 'Removing existiing Kitty...'
sudo rm -rf /opt/kitty
echo 'Moving new Kitty version to /opt/kitty'

sudo mv /tmp/kitty /opt
echo 'Success'
