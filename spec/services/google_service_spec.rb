require 'rails_helper'

RSpec.describe "google api service" do
	it "should return lat and long for a city", :vcr do
		service = GoogleService.new
		data = service.location_data("Denver", "CO")

		expect(data[:results][0][:geometry][:location]).to have_key(:lat)
		expect(data[:results][0][:geometry][:location]).to have_key(:lng)
	end
end