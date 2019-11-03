require 'rails_helper'

RSpec.describe Api::V1::ForecastsController do
	it "should show a forecast for a city" do
		# get "/api/v1/forecast?location=denver,co"
		# @controller = Api::V1::ForecastsController
		get :show, {:params => {:location => 'denver,co'}}
		data = JSON.parse(response.body)

		expect(data).to have_content("formatted_current_time")
		expect(data).to have_content("current_summary")
		expect(data[:timezone]).to eq("America/Denver")
		expect(data).to have_content("daily_summary")
		expect(data).to have_content("high")
		expect(data).to have_content("low")
		expect(data).to have_content("icon")
		expect(data).to have_content("temp")
		expect(data).to have_content("feels_like")
		expect(data).to have_content("humidity")
		expect(data).to have_content("visibility")
		expect(data).to have_content("uv_index")
		expect(data).to have_content("hourly_forecasts")
		expect(data).to have_content("daily_forecasts")
	end
end