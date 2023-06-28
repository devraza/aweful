#!/bin/bash

# Everything else is just a systemd service.
xrandr --output eDP-1 --off
emacs --daemon
