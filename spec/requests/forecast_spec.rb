require 'rails_helper'

RSpec.describe "forecast spec" do
	it "should show a forecast for a city", :vcr do
		get "/api/v1/forecast?location=denver,co"

		data = JSON.parse(response.body, symbolize_names: true)

		expect(data[:data][:attributes]).to have_key(:formatted_current_time)
		expect(data[:data][:attributes]).to have_key(:current_summary)
		expect(data[:data][:attributes][:timezone]).to eq("America/Denver")
		expect(data[:data][:attributes]).to have_key(:daily_summary)
		expect(data[:data][:attributes]).to have_key(:high)
		expect(data[:data][:attributes]).to have_key(:low)
		expect(data[:data][:attributes]).to have_key(:icon)
		expect(data[:data][:attributes]).to have_key(:temp)
		expect(data[:data][:attributes]).to have_key(:feels_like)
		expect(data[:data][:attributes]).to have_key(:humidity)
		expect(data[:data][:attributes]).to have_key(:visibility)
		expect(data[:data][:attributes]).to have_key(:uv_index)
		expect(data[:data][:attributes]).to have_key(:hourly_forecasts)
		expect(data[:data][:attributes]).to have_key(:daily_forecasts)
	end

	it "should not show a forecast for no", :vcr do
		get "/api/v1/forecast?location=nowhere"

		data = JSON.parse(response.body, symbolize_names: true)

		expect(data).to eq({message: 'No forecast'})
	end
end