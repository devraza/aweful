#!/bin/bash

export SCRIPTPATH="$(
  cd "$(dirname "$0")" || exit
  pwd -P
)"

picom &
pipewire &
pipewire-pulse &
emacs --daemon &
mpd &
$SCRIPTPATH/monitors.sh
alacritty --class spad -e tiny &
