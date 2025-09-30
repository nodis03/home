#!/bin/sh
scrot -s -q 100 -e 'xclip -selection clipboard -t image/png -i $f && rm $f'
