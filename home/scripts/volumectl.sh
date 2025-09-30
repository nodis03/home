#!/usr/bin/env bash

sink="@DEFAULT_SINK@"

case "$1" in
  up)   pactl set-sink-volume "$sink" +5% ;;
  down) pactl set-sink-volume "$sink" -5% ;;
  *)    echo "Uso: $0 up|down" >&2; exit 1 ;;
esac

vol=$(pactl get-sink-volume "$sink" \
      | grep -Po '\d+%' | head -n1)
num=${vol%\%}
