require 'rails_helper'

RSpec.describe "road trips spec" do
	it "should return the forecast, and eta at the destination", :vcr do
		user = {
			"email": "whatever@example.com",
			"password": "password",
			"password_confirmation": "password"
			}

		post "/api/v1/users", params: user.to_json
		api_key = User.last.api_key

		body = {
			"origin": "Denver,CO",
			"destination": "Pueblo,CO",
			"api_key": "#{api_key}"
		  }

		headers = { "CONTENT_TYPE" => "application/json" }

		req = post "/api/v1/road_trip", params: body.to_json, headers: headers
		data = JSON.parse(response.body, symbolize_names: true, quirks_mode: true)
		
		expect(req).to eq(200)
		expect(data[:data][:attributes]).to have_key(:arrival_forecast)
		expect(data[:data][:attributes]).to have_key(:origin)
		expect(data[:data][:attributes]).to have_key(:destination)
		expect(data[:data][:attributes]).to have_key(:approx_hours_to_destination)
	end
end