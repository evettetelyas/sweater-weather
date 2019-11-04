require 'rails_helper'

RSpec.describe "antipode spec" do
	it "should show antipode city data for a city", :vcr do

		get "/api/v1/antipode?location=hongkong"

		data = JSON.parse(response.body, symbolize_names: true)

		expect(data[:data][:attributes]).to have_key(:location_name)
		expect(data[:data][:attributes]).to have_key(:forecast)
		expect(data[:data][:attributes]).to have_key(:search_location)
	end
end