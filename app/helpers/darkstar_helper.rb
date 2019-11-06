module DarkstarHelper

	def darksky_service
		DarkskyApiService.new
	end

	def forecast_data(lat, lng)
		darksky_service.forecast_data(format_latlng(lat, lng))
	end
end