require 'rails_helper'

RSpec.describe "flickr api service" do
	it "should return an image for a city", :vcr do
		service = FlickrService.new
		data = service.image_data("denver", "co", "39.7392","-104.9903")

		expect(data[:photos][:photo][0]).to have_key(:title)
		expect(data[:photos][:photo][0]).to have_key(:server)
		expect(data[:photos][:photo][0]).to have_key(:id)
		expect(data[:photos][:photo][0]).to have_key(:secret)
	end
end