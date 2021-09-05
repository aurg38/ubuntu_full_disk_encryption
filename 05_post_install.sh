#!/bin/bash

# Mount partitions BOOT + Root
mkdir -p /mnt/ext4
mount /dev/mapper/ubuntu--vg-root /mnt/ext4
mount /dev/mapper/LUKS_BOOT /mnt/ext4/boot

# Check mount
ls /mnt/ext4
ls /mnt/ext4/boot
