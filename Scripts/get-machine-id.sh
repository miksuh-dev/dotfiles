#!/bin/bash

echo -n $(cat /etc/machine-id) | openssl dgst -sha512 | sed 's/^.* //' | head -c 10

