require "rails_helper"

RSpec.describe CityResultFacade do  
  it "#find_city_weather", :vcr do
    city = "cincinatti" 
    state = "oh"
    search_results = CityResultFacade.new(city, state).city_service
    expect(search_results).to be_a(CityResult)
    expect(search_results.lat).to be_a(Float)
    expect(search_results.lng).to be_a(Float)
  end
end