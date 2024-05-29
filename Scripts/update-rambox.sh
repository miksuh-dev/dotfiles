#!/bin/bash

url=$(curl -s https://api.github.com/repos/ramboxapp/download/releases/latest \
| jq '.assets[]  | select(.name | endswith("linux-x64.AppImage")) | .browser_download_url' \
| tr -d '"')

rm -rf /tmp/rambox || exit 1
wget -P /tmp -O /tmp/rambox $url || exit 1
chmod +x /tmp/rambox
echo 'Downloaded newest version'

echo 'Moving new Rambox version to /opt/rambox'
sudo mkdir -p /opt/rambox
sudo mv /tmp/rambox /opt/rambox/rambox || exit 1
echo 'Success'
