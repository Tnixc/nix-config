local colors = require("sbar-config-libs/colors")
local icons = require("sbar-config-libs/icons")
local settings = require("sbar-config-libs/settings")
local weather_config = require("sbar-config-libs/weather_config")

-- WeatherAPI condition codes to weather conditions mapping
local function get_weather_emoji(code)
	local WEATHER_API_CONDITIONS = {
		-- Map WeatherAPI condition codes to weather descriptions
		[1000] = "Sunny", -- Sunny / Clear
		[1003] = "PartlyCloudy", -- Partly cloudy
		[1006] = "Cloudy", -- Cloudy
		[1009] = "VeryCloudy", -- Overcast
		[1030] = "Fog", -- Mist
		[1063] = "LightShowers", -- Patchy rain possible
		[1066] = "LightSnow", -- Patchy snow possible
		[1069] = "LightSleet", -- Patchy sleet possible
		[1072] = "LightSleet", -- Patchy freezing drizzle possible
		[1087] = "ThunderyShowers", -- Thundery outbreaks possible
		[1114] = "HeavySnow", -- Blowing snow
		[1117] = "HeavySnow", -- Blizzard
		[1135] = "Fog", -- Fog
		[1147] = "Fog", -- Freezing fog
		[1150] = "LightRain", -- Patchy light drizzle
		[1153] = "LightRain", -- Light drizzle
		[1168] = "LightSleet", -- Freezing drizzle
		[1171] = "LightSleet", -- Heavy freezing drizzle
		[1180] = "LightRain", -- Patchy light rain
		[1183] = "LightRain", -- Light rain
		[1186] = "HeavyRain", -- Moderate rain at times
		[1189] = "HeavyRain", -- Moderate rain
		[1192] = "HeavyRain", -- Heavy rain at times
		[1195] = "HeavyRain", -- Heavy rain
		[1198] = "LightSleet", -- Light freezing rain
		[1201] = "LightSleet", -- Moderate or heavy freezing rain
		[1204] = "LightSleet", -- Light sleet
		[1207] = "LightSleet", -- Moderate or heavy sleet
		[1210] = "LightSnow", -- Patchy light snow
		[1213] = "LightSnow", -- Light snow
		[1216] = "HeavySnow", -- Patchy moderate snow
		[1219] = "HeavySnow", -- Moderate snow
		[1222] = "HeavySnow", -- Patchy heavy snow
		[1225] = "HeavySnow", -- Heavy snow
		[1237] = "LightSleet", -- Ice pellets
		[1240] = "LightShowers", -- Light rain shower
		[1243] = "HeavyShowers", -- Moderate or heavy rain shower
		[1246] = "HeavyShowers", -- Torrential rain shower
		[1249] = "LightSleetShowers", -- Light sleet showers
		[1252] = "LightSleetShowers", -- Moderate or heavy sleet showers
		[1255] = "LightSnowShowers", -- Light snow showers
		[1258] = "HeavySnowShowers", -- Moderate or heavy snow showers
		[1261] = "LightSleetShowers", -- Light showers of ice pellets
		[1264] = "LightSleetShowers", -- Moderate or heavy showers of ice pellets
		[1273] = "ThunderyShowers", -- Patchy light rain with thunder
		[1276] = "ThunderyHeavyRain", -- Moderate or heavy rain with thunder
		[1279] = "ThunderySnowShowers", -- Patchy light snow with thunder
		[1282] = "HeavySnowShowers", -- Moderate or heavy snow with thunder
	}

	local WEATHER_SYMBOLS = {
		["Unknown"] = "􀿩 ",
		["Sunny"] = "􀆮 ",
		["PartlyCloudy"] = "􀇕 ",
		["Cloudy"] = "􀇃 ",
		["VeryCloudy"] = "􀇣 ",
		["Fog"] = "􀇋 ",
		["LightRain"] = "􀇗 ",
		["HeavyRain"] = "􀇇 ",
		["LightShowers"] = "􀇗 ",
		["HeavyShowers"] = "􀇇 ",
		["LightSleet"] = "􀇑 ",
		["LightSleetShowers"] = "􀇏",
		["LightSnow"] = "􀇏 ",
		["HeavySnow"] = "􀇥 ",
		["LightSnowShowers"] = "􀇏 ",
		["HeavySnowShowers"] = "􀇥 ",
		["ThunderyShowers"] = "􀇙 ",
		["ThunderyHeavyRain"] = "􀇟 ",
		["ThunderySnowShowers"] = "􀇟 ",
	}

	local condition = WEATHER_API_CONDITIONS[code]
	return WEATHER_SYMBOLS[condition] or WEATHER_SYMBOLS["Unknown"]
end

local weather_high = sbar.add("item", "widgets.weather_high", {
	position = "right",
	update_freq = weather_config.update_freq,
	padding_left = -8,
	width = 0,
	icon = {
		padding_right = 0,
		font = {
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		color = colors.orange,
		string = icons.wifi.upload,
	},
	label = {
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		color = colors.orange,
		string = "??°",
	},
	y_offset = 4,
})

local weather_low = sbar.add("item", "widgets.weather_low", {
	position = "right",
	padding_left = -8,
	icon = {
		padding_right = 0,
		font = {
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		string = icons.wifi.download,
		color = colors.blue,
	},
	label = {
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		color = colors.blue,
		string = "??°",
	},
	y_offset = -4,
})

local weather_current = sbar.add("item", "widgets.weather_current", {
	position = "right",
	icon = {
		string = " ",
		font = {
			style = settings.font.style_map["Regular"],
			size = 17.0,
		},
	},
	label = { font = { family = settings.font.numbers }, string = "??°" },
})

weather_high:subscribe({ "forced", "routine", "system_woke" }, function(_)
	weather_current:set({
		label = {
			string = "...",
		},
	})

	-- Check if API key is configured
	if not weather_config.api_key then
		print("Error: WeatherAPI key not configured in weather_config.lua")
		weather_current:set({
			label = { string = "ERR" },
			icon = { string = "⚠️ " },
		})
		weather_high:set({ label = { string = "ERR" } })
		weather_low:set({ label = { string = "ERR" } })
		return
	end

	-- Get current date for history API (today)
	local today = os.date("%Y-%m-%d")

	-- Construct the weather API commands
	local history_cmd = string.format(
		"curl -s -X GET 'https://api.weatherapi.com/v1/history.json?key=%s&q=%s&dt=%s'",
		weather_config.api_key,
		weather_config.location,
		today
	)
	print(history_cmd)

	local current_cmd = string.format(
		"curl -s -X GET 'https://api.weatherapi.com/v1/current.json?key=%s&q=%s&aqi=no'",
		weather_config.api_key,
		weather_config.location
	)

	-- Execute history command first for high/low temps
	sbar.exec(history_cmd, function(history_res)
        print("getting it")
		if
			history_res
			and history_res.forecast.forecastday[1].day.maxtemp_c
			and history_res.forecast.forecastday[1].day.mintemp_c
		then
			local high_str = string.format("%d°", math.floor(history_res.forecast.forecastday[1].day.maxtemp_c))
			local low_str = string.format("%d°", math.floor(history_res.forecast.forecastday[1].day.mintemp_c))
			weather_high:set({
				label = { string = string.format("%04s", high_str) },
			})
			weather_low:set({
				label = { string = string.format("%04s", low_str) },
			})
		end

		sbar.exec(current_cmd, function(current_res)
			if current_res and current_res.current.temp_c and current_res.current.condition.code then
				local current_str = string.format("%d°", math.floor(current_res.current.temp_c))
				weather_current:set({
					label = { string = string.format("%s", current_str) },
					icon = { string = get_weather_emoji(current_res.current.condition.code) },
				})
			else
				weather_current:set({
					label = { string = " ERR" },
					icon = { string = "⚠️ " },
				})
			end
		end)
	end)
end)
