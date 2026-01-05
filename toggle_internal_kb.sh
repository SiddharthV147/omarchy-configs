
#!/bin/bash

DEVICE="ite-tech.-inc.-ite-device(8176)-keyboard"

STATE=$(hyprctl devices -j | jq -r ".keyboards[] | select(.name==\"$DEVICE\") | .enabled")

if [ "$STATE" = "true" ]; then
    hyprctl keyword input:keyboard:$DEVICE:enabled false
    notify-send "Internal Keyboard Disabled"
else
    hyprctl keyword input:keyboard:$DEVICE:enabled true
    notify-send "Internal Keyboard Enabled"
fi

