#!/bin/bash

feh --bg-fill ~/.config/awesome/assets/wallpapers/graphite-ultrawide.png
pkill redshift
pkill redshift
redshift -l 52.486244:-1.890401 &
picom &
emacs --daemon &
mpd &
