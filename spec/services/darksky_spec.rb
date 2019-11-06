require 'rails_helper'

RSpec.describe "darkstar api service" do
	it "should return a forecast for a city", :vcr do
		service = DarkskyApiService.new
		data = service.forecast_data("39.7392,-104.9903")

		expect(data).to have_key(:latitude)
		expect(data).to have_key(:longitude)
		expect(data).to have_key(:currently)
		expect(data).to have_key(:hourly)
		expect(data).to have_key(:daily)
	end
end