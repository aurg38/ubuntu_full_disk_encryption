#!/bin/bash

# Variables
DEV="/dev/nvme0n1"
DM="${DEV##*/}"
DEVP="${DEV}$( if [[ "$DEV" =~ "nvme" ]]; then echo "p"; fi )"
DM="${DM}$( if [[ "$DM" =~ "nvme" ]]; then echo "p"; fi )"

#Size swap
SWAP=32G

# Format : LVM alignement = 1M
mkfs.ext4 -L boot /dev/mapper/LUKS_BOOT
mkfs.vfat -F 16 -n EFI-SP ${DEVP}3

pvcreate --dataalignment 1m /dev/mapper/${DM}5_crypt
vgcreate -s 1m ubuntu-vg /dev/mapper/${DM}5_crypt
lvcreate -L $SWAP -n swap_1 ubuntu-vg
lvcreate -l 80%FREE -n root ubuntu-vg

