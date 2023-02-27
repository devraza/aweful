#!/bin/bash

pkill redshift
pkill picom
pkill mpd
redshift -l 52.486244:-1.890401 &
kitty -1 --start-as minimized &
picom &
emacs --daemon &
mpd &
