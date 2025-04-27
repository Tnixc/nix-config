return {
	black = 0xFF000000,
	white = 0xFFD8D6C9,
	red = 0xFFCB7676,
	green = 0xFF80A665,
	blue = 0xFF687eaa,
	yellow = 0xFFCC9B70,
	orange = 0xFFCC8D70,
	magenta = 0xFFBC76C1,
	grey = 0xFFB2B0A6,
	transparent = 0x00000000,

	bar = {
		bg = 0x00000000,
		border = 0x00FFFFFF,
	},

	popup = {
		bg = 0x99121212,
		border = 0xFF24273A,
	},

	bg1 = 0x00000000,
	bg2 = 0x001F1F1F,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00FFFFFF) | (math.floor(alpha * 255.0) << 24)
	end,
}
