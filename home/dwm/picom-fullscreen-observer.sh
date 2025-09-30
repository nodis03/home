#!/usr/bin/env bash

# Intervalo de comprobaciones
INTERVAL=1

# Estado anterior: "" al arrancar, luego "fs" o "norm"
prev_state=""

while true; do
    # Chequear ventana activa
    win=$(xdotool getactivewindow 2>/dev/null) || { sleep "$INTERVAL"; continue; }

    # Comprobar si esta en fullscreen
    if xprop -id "$win" _NET_WM_STATE | grep -q "_NET_WM_STATE_FULLSCREEN"; then
        # Si esta en fullscreen fuiste picom
        if [ "$prev_state" != "fs" ]; then
            pkill picom
            prev_state="fs"
        fi
    else
        # Si salimos de fullscreen y picom no esta, venga para aca picom bienvenido a la vida jeje jojo jiji
        if [ "$prev_state" != "norm" ]; then
            if ! pgrep -x picom >/dev/null; then
                picom --daemon &
            fi
            prev_state="norm"
        fi
    fi

    sleep "$INTERVAL"
done
