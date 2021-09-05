#!/bin/bash

# variables
DEV="/dev/nvme0n1"
DM="${DEV##*/}"
DEVP="${DEV}$( if [[ "$DEV" =~ "nvme" ]]; then echo "p"; fi )"
DM="${DM}$( if [[ "$DM" =~ "nvme" ]]; then echo "p"; fi )"

# reset disk
sgdisk --zap-all $DEV

# create new partitions
sgdisk --new=1:0:+768M $DEV
sgdisk --new=2:0:+2M $DEV
sgdisk --new=3:0:+128M $DEV
sgdisk --new=5:0:0 $DEV
sgdisk --typecode=1:8301 --typecode=2:ef02 --typecode=3:ef00 --typecode=5:8301 $DEV
sgdisk --change-name=1:/boot --change-name=2:GRUB --change-name=3:EFI-SP --change-name=5:rootfs $DEV
sgdisk --hybrid 1:2:3 $DEV

# show new partitions
sgdisk --print $DEV