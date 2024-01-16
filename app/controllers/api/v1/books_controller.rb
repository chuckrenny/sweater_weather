class Api::V1::BooksController < ApplicationController
  def search
    location = params[:location]
    quantity = params[:quantity].to_i

    forecast = WeatherService.new.find_weather_data(location)

    books_data = BookService.new.search_books(location, quantity)

    render json: BookSearchSerializer.new(location, forecast, books_data, quantity).serialized_json
  end
end