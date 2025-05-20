#!/bin/sh

appName=$1
className=$2

hyprctl clients | grep class:.$className \
 && echo hyprctl keyword workspace $( hyprctl clients | grep class..$className -B4 && hyprctl dispatch focuswindow "class:^$className" ) \
 || $appName

