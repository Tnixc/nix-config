#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Restart AeroSpace
# @raycast.mode silent

# Optional parameters:
# @raycast.icon icon.png

# Documentation:
# @raycast.author tnixc
# @raycast.authorURL https://raycast.com/tnixc

export USER='tnixc'

# Kill existing AeroSpace processes
killall -q AeroSpace aerospace || echo "No AeroSpace processes running"

# Start AeroSpace
/Applications/AeroSpace.app/Contents/MacOS/AeroSpace &