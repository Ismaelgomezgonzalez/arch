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

grub-install --target=i386-pc /dev/sda1
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable sddm
systemctl enable NetworkManager

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc

echo "uncomment es_ES.UTF-8 UTF-8"
gedit /etc/locale.gen
locale-gen

echo "LANG=es_ES.UTF-8"
gedit /etc/locale.conf

echo "KEYMAP=es"
gedit /etc/vconsole.conf

gedit /ect/hostname #myhostname

gedit /etc/hosts #localhost and myhostname.localdomain myhostname

mkinitcpio -P

passwd

systemctl start sddm
