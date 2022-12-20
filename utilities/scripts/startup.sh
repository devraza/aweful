#!/bin/bash

picom &

export SCRIPTPATH="$(
  cd "$(dirname "$0")" || exit
  pwd -P
)"

emacs --daemon &
pulseaudio &
mpd &
$SCRIPTPATH/monitors.sh
alacritty --class spad -e tiny &
