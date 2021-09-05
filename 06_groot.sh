#!/bin/bash

# Download + Install Groot 
cd /tmp
curl -s -L https://github.com/teejee2008/groot/releases/latest | egrep -o 'teejee2008/groot/releases/download/.*/groot-v[0-9.]*-amd64.run' | wget --base=http://github.com/ -i - -O groot-latest-amd64.run && chmod a+x ./groot-latest-amd64.run && ./groot-latest-amd64.run

# Copy last script
cp ./07_write_keys.sh /mnt/ext4/opt/

# Chroot in /mnt/ext4
cd /mnt/ext4
groot
