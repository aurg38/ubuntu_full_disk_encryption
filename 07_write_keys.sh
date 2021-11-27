#!/bin/bash

# Variables
DEV="/dev/nvme0n1"
DM="${DEV##*/}"
DEVP="${DEV}$( if [[ "$DEV" =~ "nvme" ]]; then echo "p"; fi )"
DM="${DM}$( if [[ "$DM" =~ "nvme" ]]; then echo "p"; fi )"

# update cryptsetup-initramfs
/usr/bin/apt install -y cryptsetup-initramfs

# setup initramfs
echo "KEYFILE_PATTERN=/etc/luks/*.keyfile" >> /etc/cryptsetup-initramfs/conf-hook
echo "UMASK=0077" >> /etc/initramfs-tools/initramfs.conf

# Create keys file for boot
/usr/bin/mkdir /etc/luks
/usr/bin/dd if=/dev/urandom of=/etc/luks/boot_os.keyfile bs=512 count=1

/usr/bin/chmod u=rx,go-rwx /etc/luks
/usr/bin/chmod u=r,go-rwx /etc/luks/boot_os.keyfile

/usr/sbin/cryptsetup luksAddKey ${DEVP}1 /etc/luks/boot_os.keyfile
/usr/sbin/cryptsetup luksAddKey ${DEVP}5 /etc/luks/boot_os.keyfile

# Add UUID + options to crypttab
echo "LUKS_BOOT UUID=$(blkid -s UUID -o value ${DEVP}1) /etc/luks/boot_os.keyfile luks,discard" >> /etc/crypttab
echo "${DM}5_crypt UUID=$(blkid -s UUID -o value ${DEVP}5) /etc/luks/boot_os.keyfile luks,discard" >> /etc/crypttab

# Update initramfs
/usr/sbin/update-initramfs -u -k all
