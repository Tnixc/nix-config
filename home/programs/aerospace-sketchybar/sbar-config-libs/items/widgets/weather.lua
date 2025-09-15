local colors = require("sbar-config-libs/colors")
local icons = require("sbar-config-libs/icons")
local settings = require("sbar-config-libs/settings")

local function get_weather_emoji(code)
  local WWO_CODE = {
    ["113"] = "Sunny",
    ["116"] = "PartlyCloudy",
    ["119"] = "Cloudy",
    ["122"] = "VeryCloudy",
    ["143"] = "Fog",
    ["176"] = "LightShowers",
    ["179"] = "LightSleetShowers",
    ["182"] = "LightSleet",
    ["185"] = "LightSleet",
    ["200"] = "ThunderyShowers",
    ["227"] = "LightSnow",
    ["230"] = "HeavySnow",
    ["248"] = "Fog",
    ["260"] = "Fog",
    ["263"] = "LightShowers",
    ["266"] = "LightRain",
    ["281"] = "LightSleet",
    ["284"] = "LightSleet",
    ["293"] = "LightRain",
    ["296"] = "LightRain",
    ["299"] = "HeavyShowers",
    ["302"] = "HeavyRain",
    ["305"] = "HeavyShowers",
    ["308"] = "HeavyRain",
    ["311"] = "LightSleet",
    ["314"] = "LightSleet",
    ["317"] = "LightSleet",
    ["320"] = "LightSnow",
    ["323"] = "LightSnowShowers",
    ["326"] = "LightSnowShowers",
    ["329"] = "HeavySnow",
    ["332"] = "HeavySnow",
    ["335"] = "HeavySnowShowers",
    ["338"] = "HeavySnow",
    ["350"] = "LightSleet",
    ["353"] = "LightShowers",
    ["356"] = "HeavyShowers",
    ["359"] = "HeavyRain",
    ["362"] = "LightSleetShowers",
    ["365"] = "LightSleetShowers",
    ["368"] = "LightSnowShowers",
    ["371"] = "HeavySnowShowers",
    ["374"] = "LightSleetShowers",
    ["377"] = "LightSleet",
    ["386"] = "ThunderyShowers",
    ["389"] = "ThunderyHeavyRain",
    ["392"] = "ThunderySnowShowers",
    ["395"] = "HeavySnowShowers",
  }
  local WEATHER_SYMBOL = {
    ["Unknown"] = "􀿩 ",
    ["Cloudy"] = "􀇃 ",
    ["Fog"] = "􀇋 ",
    ["HeavyRain"] = "􀇇 ",
    ["HeavyShowers"] = "􀇇 ",
    ["HeavySnow"] = "􀇥 ",
    ["HeavySnowShowers"] = "􀇥 ",
    ["LightRain"] = "􀇗 ",
    ["LightShowers"] = "􀇗 ",
    ["LightSleet"] = "􀇑 ",
    ["LightSleetShowers"] = "🌧",
    ["LightSnow"] = "􀇏 ",
    ["LightSnowShowers"] = "􀇏 ",
    ["PartlyCloudy"] = "􀇕 ",
    ["Sunny"] = "􀆮 ",
    ["ThunderyHeavyRain"] = "􀇟 ",
    ["ThunderyShowers"] = "􀇙 ",
    ["ThunderySnowShowers"] = "􀇟 ",
    ["VeryCloudy"] = "􀇣 ",
  }
  local code_str = tostring(code)
  local condition = WWO_CODE[code_str]
  return WEATHER_SYMBOL[condition] or WEATHER_SYMBOL["Unknown"]
end

local weather_high = sbar.add("item", "widgets.weather_high", {
  position = "right",
  update_freq = 180,
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
  sbar.exec(
    "curl wttr.in/Waterloo+Ontario?format=j2 | jq '{high: .weather[0].maxtempC, low: .weather[0].mintempC, current: .current_condition[0].temp_C, weatherCode: .current_condition[0].weatherCode}'",
    function(res)
      weather_high:set({
        label = {
          string = res.high .. "°",
        },
      })
      weather_low:set({
        label = {
          string = res.low .. "°",
        },
      })
      weather_current:set({
        label = {
          string = res.current .. "°",
        },
        icon = { string = get_weather_emoji(res.weatherCode) },
      })
    end
  )
end)
