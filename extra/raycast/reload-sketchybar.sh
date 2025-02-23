#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Reload sketchybar
# @raycast.mode silent

# Optional parameters:
# @raycast.icon icon.png

# Documentation:
# @raycast.author tnixc
# @raycast.authorURL https://raycast.com/tnixc

export USER='tnixc'
/run/current-system/sw/bin/sketchybar --reload

