#!/bin/sh
d=$(date +'%d-%m-%Y') && f="$d.png" && i=2 && while [[ -e ~/screenshots/"$f" ]]; do f="$d ($i).png"; ((i++)); done && scrot "$f" && mv "$f" ~/screenshots/
