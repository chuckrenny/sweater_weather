class CityService
  def conn
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address")
  end
 
 
  def find_city_weather(city, state)
    response = conn.get do |req|
      req.params['location'] = "#{city},#{state}"
      req.params['key'] = Rails.application.credentials.mapquest[:key]
    end
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end