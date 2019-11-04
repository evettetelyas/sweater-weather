require 'rails_helper'

RSpec.describe "antipode api service" do
	it "should return antipode coords for a city", :vcr do
		service = AntipodeService.new
		data = service.antipode_data(-22.3193039,-65.8306389)

		expect(data[:data][:attributes]).to have_key(:lat)
		expect(data[:data][:attributes]).to have_key(:long)
	end
end