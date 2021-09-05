#!/bin/bash

# Variables
DEV="/dev/nvme0n1"
DM="${DEV##*/}"
DEVP="${DEV}$( if [[ "$DEV" =~ "nvme" ]]; then echo "p"; fi )"
DM="${DM}$( if [[ "$DM" =~ "nvme" ]]; then echo "p"; fi )"

# crypt partition boot + root
cryptsetup luksFormat --type=luks1 --align-payload=2048 --iter-time=500 --hash=sha256 ${DEVP}1
cryptsetup luksFormat --hash=sha256 --align-payload=2048 --pbkdf=argon2id ${DEVP}5

# unlock partitions
cryptsetup open ${DEVP}1 LUKS_BOOT
cryptsetup open ${DEVP}5 ${DM}5_crypt

# check list partitions
ls /dev/mapper/
