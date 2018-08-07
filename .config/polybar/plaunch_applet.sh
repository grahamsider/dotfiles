#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

sleep 0.1

# Set environment variable
sed -i '11s/.*/export PBAR_APPLET=true/' $HOME/.bash_profile
source $HOME/.bash_profile

# Launch top bar
polybar -c=$HOME/.config/polybar/config_applet top &

# Done
