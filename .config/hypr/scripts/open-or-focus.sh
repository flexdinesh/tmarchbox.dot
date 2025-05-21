#!/bin/sh

execCommand=$1
className=$2

MATCH=$(hyprctl clients | grep -iA5 "class:.*$className" | grep 'class:' | head -n1 | awk -F': ' '{print $2}')

if [ -n "$MATCH" ]; then
  # Focus the first matching window
  hyprctl dispatch focuswindow "class:.*$className.*"
else
  $execCommand &
fi


# hyprctl clients | grep class:.$className \
#  && echo hyprctl keyword workspace $( hyprctl clients | grep class..$className -B4 && hyprctl dispatch focuswindow "class:^$className" ) \
#  || $execCommand

