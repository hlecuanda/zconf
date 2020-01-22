#!/usr/bin/env zsh

zparseopts -D -E -M -a opts -A withvals - \
    i -invert

(( ! $+opts[-i] )) \
    && xclip -o | xclip -i -selection clipboard \
    || xclip -o -selection clipboard | xclip -i

echo 

