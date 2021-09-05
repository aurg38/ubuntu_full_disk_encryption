#!/bin/bash

# Active Cyptodisk option in grub
while [ ! -d /target/etc/default/grub.d ]; do sleep 1; done; echo "GRUB_ENABLE_CRYPTODISK=y" > /target/etc/default/grub.d/local.cfg

# Check active option
cat /target/etc/default/grub.d/local.cfg