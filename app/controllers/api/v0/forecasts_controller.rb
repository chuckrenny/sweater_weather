class Api::V0::ForecastsController < ApplicationController
  def show
    city = params[:location].split(',').first
    state = params[:location].split(',').last
    coords = CityService.new.find_city_weather(city, state)

    if coords
      weather_data = WeatherService.new.get_weather(coords.lat, coords.lng)
      forecast = WeatherForecast.new(weather_data)
      render json: forecast
    else
      render json: { error: 'Location not found' }, status: :not_found
    end
  end
end
