-- Require the sketchybar module
sbar = require("sketchybar")

-- Set the bar name, if you are using another bar instance than sketchybar
-- sbar.set_bar_name("bottom_bar")

-- Bundle the entire initial configuration into a single message to sketchybar
sbar.begin_config()
print("starting bar")
require("sbar-config-libs/bar")
print("starting default")
require("sbar-config-libs/default")
print("starting items")
require("sbar-config-libs/items")
sbar.end_config()
print("config loaded")

-- Run the event loop of the sketchybar module (without this there will be no
-- callback functions executed in the lua module)
sbar.event_loop()
