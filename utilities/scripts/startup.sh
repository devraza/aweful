#!/bin/bash

# Everything else is just a systemd service.
picom &
emacs --daemon &
