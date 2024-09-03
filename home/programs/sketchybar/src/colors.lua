return {
	black = 0xFF181926,
	white = 0xFFBECAF9,
	red = 0xFFFF6A7B,
	green = 0xFF90D05A,
	blue = 0xFF6EA3FE,
	yellow = 0xFFE9AD5B,
	orange = 0xFFFF9856,
	magenta = 0xFFC198FD,
	grey = 0xFF5A607A,
	transparent = 0x00000000,

	bar = {
		bg = 0x00FFFFFF,
		border = 0x00FFFFFF,
	},
	popup = {
		bg = 0xFF363A4F,
		border = 0xFF24273A,
	},
	bg1 = 0xFF24273A,
	bg2 = 0xFF1E2030,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00FFFFFF) | (math.floor(alpha * 255.0) << 24)
	end,
}
