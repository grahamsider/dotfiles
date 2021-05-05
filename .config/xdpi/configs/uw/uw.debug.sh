#!/bin/sh

XDPI_CONF_DIR="$XDG_CONFIG_HOME/xdpi/configs"
CURR_CONF_DIR="$XDPI_CONF_DIR/uw"
i3_DIFF_PATH="$CURR_CONF_DIR/diffs/i3.diff"

export PULSE_RUNTIME_PATH="/run/user/1000/pulse"

# Get pulseaudio card index
AUDIO_CARD_INDEX=$(pacmd list-cards | grep "index" | sed "s/^.*index:\s*//")

# Turn off laptop display, turn on uw display
#xrandr --output eDP1 --off --output DP1 --mode 3440x1440 --pos 0x0 --rotate normal --output DP2 --off --output HDMI1 --off --output VIRTUAL1 --off

# Change bg to fit uw display
feh --bg-fill $HOME/Pictures/3440x1440/jupiter.png

# Change pulseaudio profile to hdmi-stereo
pacmd set-card-profile $AUDIO_CARD_INDEX output:hdmi-stereo+input:analog-stereo

# Get new audio sink index
AUDIO_SINK_INDEX=$(pacmd list-sinks | grep "index" | sed "s/^.*index:\s*//")

# Ensure i3.diff audio sink is accurate before applied so media keys work properly
sed -i "s/^>\s*set-sink-volume.*$/> set-sink-volume $AUDIO_SINK_INDEX/" "$i3_DIFF_PATH"
sed -i "s/^>\s*set-sink-mute.*$/> set-sink-mute $AUDIO_SINK_INDEX/" "$i3_DIFF_PATH"
