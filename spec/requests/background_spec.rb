require 'rails_helper'

RSpec.describe "background spec" do
	it "should show a background for a city" do

		get "/api/v1/backgrounds?location=denver,co"

		data = JSON.parse(response.body, symbolize_names: true)

		expect(data[:data][:attributes]).to have_key(:id)
		expect(data[:data][:attributes]).to have_key(:image_url)
		expect(data[:data][:attributes]).to have_key(:title)
	end
end