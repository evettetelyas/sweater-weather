class ForecastFacade

	def initialize(location)
		@city = location.split(",")[0]
		@state = location.split(",")[1]
	end

	def google_service
		GoogleService.new
	end

	def get_location_data
		location = @city + "+" + @state
		google_service.location_data(location)
	end

	def lat_lng
		get_location_data[:results][0][:geometry][:location]
	end

	def format_latlng
		lat_lng[:lat].round(4).to_s + "," + lat_lng[:lng].round(4).to_s
	end

	def darksky_service
		DarkskyApiService.new
	end

	def forecast_data
		darksky_service.forecast_data(format_latlng)
	end

	def create_forecast
		forecast = Forecast.new(forecast_data)
		forecast.create_hourly(forecast_data[:hourly][:data], forecast.timezone)
		forecast.create_daily(forecast_data[:daily][:data])
		forecast
	end


end