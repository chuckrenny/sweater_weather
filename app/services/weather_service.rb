class WeatherService
  def conn
    Faraday.new(url: "http://api.weatherapi.com/v1/forecast.json")
  end
 
 
  def find_weather_data(lat, lng)
    response = conn.get do |req|
      req.params['key'] = Rails.application.credentials.weather[:key]
      req.params['q'] = "#{lat},#{lng}"
      req.params['days'] = 5
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end