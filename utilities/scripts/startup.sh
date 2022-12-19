#!/bin/bash

picom &

export SCRIPTPATH="$(
  cd "$(dirname "$0")" || exit
  pwd -P
)"

emacs --daemon &
pulseaudio &
mpd &
alacritty --class spad -e tiny &
$SCRIPTPATH/monitors.sh
