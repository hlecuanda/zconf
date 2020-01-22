#!/usr/bin/env zsh
xclip -selection clipboard -o  \
| qrencode -t PNG -m1 -s16 -lH  -o - \
| feh --zoom -- -
