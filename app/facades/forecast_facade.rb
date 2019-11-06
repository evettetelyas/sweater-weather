class ForecastFacade
	include GoogleHelper
	include DarkstarHelper
	
	def initialize(location)
		@city = location.split(",")[0]
		@state = location.split(",")[1]
	end

	def create_forecast
		forecast = Forecast.new(forecast_data(lat_lng[:lat], lat_lng[:lng]))
		forecast.create_hourly(forecast_data(lat_lng[:lat], lat_lng[:lng])[:hourly][:data], forecast.timezone)
		forecast.create_daily(forecast_data(lat_lng[:lat], lat_lng[:lng])[:daily][:data])
		forecast
	end


end