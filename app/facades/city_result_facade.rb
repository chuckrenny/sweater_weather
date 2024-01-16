class CityResultFacade
  def initialize(city, state)
    @city = city
    @state = state
  end

  def city_service
    service = CityService.new
    results = service.find_city_weather(@city, @state)
    CityResult.new(results)
  end
end