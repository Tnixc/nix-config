local colors = require("sbar-config-libs/colors")
local settings = require("sbar-config-libs/settings")

local front_app = sbar.add("item", "front_app", {
    display = "active",
    icon = { drawing = false },
    label = {
        font = {
            size = 15.0,
        },
    },
    updates = true,
})

front_app:subscribe("front_app_switched", function(env)
    front_app:set({ label = { string = env.INFO } })
end)

front_app:subscribe("mouse.clicked", function(env)
    sbar.trigger("swap_menus_and_spaces")
end)
