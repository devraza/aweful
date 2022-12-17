#!/bin/bash

export SCRIPTPATH="$(
  cd "$(dirname "$0")" || exit
  pwd -P
)"

$SCRIPTPATH/monitors.sh
emacs --daemon &
pipewire &
pipewire-pulse &
picom &
mpd &
alacritty --class spad -e tiny &
