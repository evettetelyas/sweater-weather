class ForecastFacade

	def initialize(location)
		@city = location.split(",")[0]
		@state = location.split(",")[1]
	end

	def google_service
		GoogleService.new
	end

	def get_location_data
		google_service.location_data(@city, @state)
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

	# def create_hash
	# 	hash = {}
	# 	hash[:current_summary] = forecast_data[:currently][:summary]
	# 	hash[:current_time] = forecast_data[:currently][:time]
	# 	hash[:daily_summary] = forecast_data[:daily][:data][0][:summary]
	# 	hash[:high] = forecast_data[:daily][:data][0][:temperatureHigh]
	# 	hash[:low] = forecast_data[:daily][:data][0][:temperatureLow]
	# 	hash[:icon] = forecast_data[:currently][:icon]
	# 	hash[:temp] = forecast_data[:currently][:temperature]
	# 	hash[:feels_like] = forecast_data[:currently][:apparentTemperature]
	# 	hash[:humidity] = forecast_data[:currently][:humidity]
	# 	hash[:visibility] = forecast_data[:currently][:visibility]
	# 	hash[:uv_index] = forecast_data[:currently][:uvIndex]
	# 	hash[:timezone] = forecast_data[:timezone]
	# 	hash
	# end

	# def hourly_hash(index)
	# 	data = forecast_data[:hourly][:data][index]
	# 	hash = {}
	# 	hash[:time] = DateTime.strptime(data[:time].to_s,'%s')
	# 	# hash[:formatted_time] = hash[:time].in_time_zone(create_hash[:timezone]).strftime('%I %p')
	# 	hash[:temp] = data[:temperature]
	# 	hash
	# end

	# def daily_hash(index)
	# 	data = forecast_data[:daily][:data][index]
	# 	hash = {}
	# 	hash[:day] = DateTime.strptime(data[:time].to_s,'%s')
	# 	# hash[:formatted_day] = hash[:day].in_time_zone(create_hash[:timezone]).strftime('%A')
	# 	hash[:summary] = data[:summary]
	# 	hash[:icon] = data[:icon]
	# 	hash[:precip_pct] = data[:precipProbability]
	# 	hash[:high] = data[:temperatureHigh]
	# 	hash[:low] = data[:temperatureLow]
	# 	hash
	# end

	# def create_hourly(forecast)
	# 	(0..7).to_a.each do |index|
	# 		forecast.hourly_forecasts.create(hourly_hash(index))
	# 	end
	# end

	# def create_daily(forecast)
	# 	(0..4).to_a.each do |index|
	# 		forecast.daily_forecasts.create(daily_hash(index))
	# 	end
	# end

	def create_forecast
		# forecast = Forecast.create(create_hash)
		forecast = PoroForecast.new(forecast_data)
		# create_hourly(forecast)
		# create_daily(forecast)
		forecast.create_hourly(forecast_data[:hourly][:data], forecast.timezone)
		forecast.create_daily(forecast_data[:daily][:data])
		forecast
	end


end