#!/bin/sh

PBAR_DIR="$HOME/.config/polybar"
PBAR_APPLET_RC_PATH="$PBAR_DIR/.pbar-applet-rc"
APPLET_STATUS=$(grep "PBAR_APPLET" $PBAR_APPLET_RC_PATH | sed "s/^.*=//")

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

sleep 0.1

# Launch top bar
if [ "$APPLET_STATUS" = "true" ]; then
    polybar -c=$HOME/.config/polybar/config_applet top &
else
    polybar -c=$HOME/.config/polybar/config top &
fi
