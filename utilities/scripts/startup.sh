#!/bin/bash

emacs --daemon &
pipewire &
pipewire-pulse &
picom &
mpd &
alacritty --class spad -e tiny &
