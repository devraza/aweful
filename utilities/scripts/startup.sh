#!/bin/bash

pkill redshift
pkill picom
pkill mpd
redshift -l 52.486244:-1.890401 &
picom &
emacs --daemon &
mpd &
