class CityResult
  attr_reader :lat, :lng

  def initialize(data)
    # require 'pry';binding.pry
    location_data = data.first[:locations]
    lat_lng = location_data.first[:latLng]
    @lat = lat_lng[:lat]
    @lng = lat_lng[:lng]
  end
end