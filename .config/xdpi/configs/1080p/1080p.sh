#!/bin/sh

XDPI_CONF_DIR="$XDG_CONFIG_HOME/xdpi/configs"
XDPI_DIFF_DIR="$XDG_CONFIG_HOME/xdpi/diffs"
CURR_CONF_DIR="$XDPI_CONF_DIR/uw"
i3_DIFF_PATH="$XDPI_DIFF_DIR/i3.diff"

# Get pulseaudio card index
AUDIO_CARD_INDEX=$(pacmd list-cards | grep "index" | sed "s/^.*index:\s*//")

# Turn off laptop display, turn on 1080p display
xrandr --output eDP1 --off --output DP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off --output HDMI1 --off --output VIRTUAL1 --off

# Change pulseaudio profile to hdmi-stereo
pacmd set-card-profile $AUDIO_CARD_INDEX output:hdmi-stereo+input:analog-stereo

# Get new audio sink index
AUDIO_SINK_INDEX=$(pacmd list-sinks | grep "index" | sed "s/^.*index:\s*//")

# Ensure i3.diff audio sink is accurate before applied so media keys work properly
sed -i "s/^>\s*set-sink-volume.*$/> set-sink-volume $AUDIO_SINK_INDEX/" "$i3_DIFF_PATH"
sed -i "s/^>\s*set-sink-mute.*$/> set-sink-mute $AUDIO_SINK_INDEX/" "$i3_DIFF_PATH"
