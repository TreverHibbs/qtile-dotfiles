#!/bin/sh
#wal -R &
zsh -c '$HOME/.config/wpg/wp_init.sh' &
copyq &
http-server -p 8085 $HOME/.config/fluidity-gh-pages &
picom --experimental-backends &
