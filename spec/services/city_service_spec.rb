require 'rails_helper'

describe CityService do
  context "instance methods" do
    context "#find_city_weather" do
      it "connects", :vcr do
        service = CityService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "returns parsed results", :vcr do
        city = "cincinatti", 
        state = "oh"
        search = CityService.new.find_city_weather(city, state)
        require 'pry';binding.pry
        expect(search.first).to be_a Hash
      end
    end
  end
end