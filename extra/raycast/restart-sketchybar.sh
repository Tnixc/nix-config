#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Restart SketchyBar
# @raycast.mode inline

# Optional parameters:
# @raycast.icon icon.png

# Documentation:
# @raycast.author tnixc
# @raycast.authorURL https://raycast.com/tnixc

export USER='tnixc'

# Use sketchybar-standalone (now available in system PATH)
/run/current-system/sw/bin/sketchybar --reload

