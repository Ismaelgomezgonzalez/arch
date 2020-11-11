#!/bin/bash

grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc
echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=es_ES.UTF-8" >> /etc/locale.conf

echo "KEYMAP=es" >> /etc/vconsole.conf

echo "arch" >> /etc/hostname

nano /etc/hosts

mkinitcpio -P

passwd
