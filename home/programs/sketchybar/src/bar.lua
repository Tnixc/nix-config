local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 50,
	color = colors.bar.bg,
	padding_right = 4,
	padding_left = 10,
    display = "main"
})
