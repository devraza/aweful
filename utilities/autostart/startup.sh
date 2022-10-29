#!/bin/sh

run() {
  if ! pgrep -f "$1"; then
    "$@" &
  fi
}

emacs --daemon &
run pipewire
run pipewire-pulse
run picom
run mpd
