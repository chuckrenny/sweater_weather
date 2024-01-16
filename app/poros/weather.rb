class Weather
  attr_reader :id, :type, :attributes

  def initialize(weather_data)
    # require 'pry';binding.pry
    @id = 'null'
    @type = 'forecast'
    @attributes = {
      current_weather: format_current_weather(weather_data),
      daily_weather: format_daily_weather(weather_data),
      hourly_weather: format_hourly_weather(weather_data)
    }
  end

  private
  def format_current_weather(data)
    {
      last_updated: data[:current][:last_updated],
      temperature: data[:current][:temp_f],
      feels_like: data[:current][:feelslike_f],
      humidity: data[:current][:humidity],
      uvi: data[:current][:uv],
      condition: data[:current][:condition][:text],
      icon: data[:current][:condition][:icon]
    }
  end

  def format_daily_weather(data)
    forecast_days = data[:forecast][:forecastday]

    daily_weather = forecast_days.map do |day|
      {
        date: day[:date],
        sunrise: day[:astro][:sunrise],
        sunset: day[:astro][:sunset],
        max_temp: day[:day][:maxtemp_f],
        min_temp: day[:day][:mintemp_f],
        condition: day[:day][:condition][:text],
        icon: day[:day][:condition][:icon]
      }
    end
  end

  def format_hourly_weather(data)
    forecast_hours = data[:forecast][:forecastday].first[:hour]

    hourly_weather = forecast_hours.map do |hour|
      {
        time: hour[:time].split(' ').last,
        temperature: hour[:temp_f],
        condition: hour[:condition][:text],
        icon: hour[:condition][:icon]
      }
    end
  end
end