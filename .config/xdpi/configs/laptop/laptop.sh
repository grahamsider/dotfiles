#!/bin/sh

XDPI_CONF_DIR="$XDG_CONFIG_HOME/xdpi/configs"
XDPI_DIFF_DIR="$XDG_CONFIG_HOME/xdpi/diffs"
CURR_CONF_DIR="$XDPI_CONF_DIR/laptop"
i3_DIFF_PATH="$XDPI_DIFF_DIR/i3.diff"

# Get pulseaudio card index
AUDIO_CARD_INDEX=$(pacmd list-cards | grep "index" | sed "s/^.*index:\s*//")

# Turn off laptop display, turn on laptop display
xrandr --output eDP1 --primary --mode 3000x2000 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output VIRTUAL1 --off

# Change bg to fit laptop display
feh --bg-fill $HOME/Pictures/3000x2000/minimal/MacOS-Big-Sur.png

# Change pulseaudio profile to analog-stereo
pacmd set-card-profile $AUDIO_CARD_INDEX output:analog-stereo+input:analog-stereo

# Get new audio sink index
AUDIO_SINK_INDEX=$(pacmd list-sinks | grep "index" | sed "s/^.*index:\s*//")

# Edit i3.diff to correct audio sink
sed -i "s/^>\s*set-sink-volume.*$/> set-sink-volume $AUDIO_SINK_INDEX/" "$i3_DIFF_PATH"
sed -i "s/^>\s*set-sink-mute.*$/> set-sink-mute $AUDIO_SINK_INDEX/" "$i3_DIFF_PATH"
