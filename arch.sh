#!/bin/bash

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda5
mkswap /dev/sda6
mkdir /mnt/home
mount /dev/sda1 /mnt
mount /dev/sda5 /mnt/home
swapon

pacstrap /mnt base base-devel linux linux-firmware firefox qtile sddm gnome thunar rofi xorg xorg-xinit neofetch gedit nano grub networkmanager feh deepin

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot
