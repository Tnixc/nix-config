return {
	black = 0xFF0A0909,
	white = 0xFFC5C9C5,
	red = 0xFFE46876,
	green = 0xFF87A987,
	blue = 0xFF7F94B4,
	yellow = 0xFFE6C384,
	orange = 0xFFE6A96D,
	magenta = 0xFFD98AAD,
	grey = 0xFFA6A69C,
	transparent = 0x00000000,

	bar = {
		bg = 0x00000000,
		border = 0x00FFFFFF,
	},

	popup = {
		bg = 0x99181616,
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
