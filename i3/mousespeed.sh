#!/bin/sh

for id in `xinput --list | grep 'PixArt HP X500 USB Optical Mouse' | perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; do
	xinput --set-prop $id "libinput Accel Speed" -0.4
done
