require 'rails_helper'

describe WeatherService do
  context "instance methods" do
    context "#find_weather_data" do
      it "connects", :vcr do
        service = WeatherService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "returns weather data", :vcr do
        lat = 48.8567
        lng = 2.3508
        search = WeatherService.new.find_weather_data(lat, lng)
        expect(search).to be_a Hash
      end
    end
  end
end