require "rails_helper"

RSpec.describe CityResult do
  it "exists" do
    attrs = [{
      :providedLocation=>{:location=>"[\"cincinatti\", \"oh\"],oh"},
        :locations=>
          [{:street=>"",
            :adminArea6=>"",
            :adminArea6Type=>"Neighborhood",
            :adminArea5=>"Cincinnati",
            :adminArea5Type=>"City",
            :adminArea4=>"Hamilton",
            :adminArea4Type=>"County",
            :adminArea3=>"OH",
            :adminArea3Type=>"State",
            :adminArea1=>"US",
            :adminArea1Type=>"Country",
            :postalCode=>"",
            :geocodeQualityCode=>"A5XBX",
            :geocodeQuality=>"CITY",
            :dragPoint=>false,
            :sideOfStreet=>"N",
            :linkId=>"0",
            :unknownInput=>"",
            :type=>"s",
            :latLng=>{:lat=>39.10713, :lng=>-84.50413},
            :displayLatLng=>{:lat=>39.10713, :lng=>-84.50413},
            :mapUrl=>""}
          ]
      }]

    search = CityResult.new(attrs)

    expect(search).to be_a CityResult
    expect(search.lat).to eq(39.10713)
    expect(search.lng).to eq(-84.50413)
  end
end