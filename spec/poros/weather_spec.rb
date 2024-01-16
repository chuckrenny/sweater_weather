require 'rails_helper'

RSpec.describe Weather do
  describe 'initialize' do
    it 'exists and has attributes' do
      sample_data = {
        current: {
          last_updated: "2024-01-16 18:15",
          temp_f: 32.0,
          feelslike_f: 27.8,
          humidity: 69,
          uv: 1.0,
          condition: { text: "Clear", icon: "//cdn.weatherapi.com/weather/64x64/night/113.png" }
        },
        forecast: {
          forecastday: [
            {
              date: "2024-01-16",
              astro: { sunrise: "07:13 AM", sunset: "08:07 PM" },
              day: {
                maxtemp_f: 36.5,
                mintemp_f: 30.5,
                condition: { text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png" }
              },
              hour: [
                {
                    "time_epoch": 1705359600,
                    "time": "2024-01-16 00:00",
                    "temp_c": -0.2,
                    "temp_f": 31.7,
                    "is_day": 0,
                    "condition": {
                        "text": "Partly cloudy",
                        "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
                        "code": 1003
                    }
                }
              ]
            }
          ]
        }
      }

      weather = Weather.new(sample_data)

      expect(weather).to be_a Weather
      expect(weather.id).to eq('null')
      expect(weather.type).to eq('forecast')

      expect(weather.attributes).to have_key(:current_weather)
      expect(weather.attributes[:current_weather][:temperature]).to eq(32.0)

      expect(weather.attributes).to have_key(:daily_weather)
      expect(weather.attributes[:daily_weather].first[:date]).to eq("2024-01-16")

      expect(weather.attributes).to have_key(:hourly_weather)
      expect(weather.attributes[:hourly_weather].first[:time]).to eq("00:00")
    end
  end
end
