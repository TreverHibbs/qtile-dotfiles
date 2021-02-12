#!/usr/bin/env bash

# -R restores the last colorscheme that was in use.
wal -R

exec gnome-session

feh --bg-tile ~/Pictures/Wallpapers/wal/ &

xsetroot -cursor_name left_ptr

