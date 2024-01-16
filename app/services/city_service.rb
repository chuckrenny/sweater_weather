class CityService
  def conn
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address") do |faraday|
      faraday.headers["Key"] = Rails.application.credentials.mapquest[:key]
    end
  end
 
 
  def find_city_weather(city, state)
    response = conn.get("?location=#{city},#{state}")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end