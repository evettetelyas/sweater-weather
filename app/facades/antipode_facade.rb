class AntipodeFacade
	attr_reader :id, :city_name, :current_weather, :location

	def initialize(location)
		@location = location
		@id = SecureRandom.hex(8)
	end

	def google_service
		GoogleService.new
	end

	def get_coords
		google_service.location_data(@location)
	end

	def lat_lng
		get_coords[:results][0][:geometry][:location]
	end

	def antipode_svc_data
		AntipodeService.new.antipode_data(lat_lng[:lat], lat_lng[:lng])
	end

	def antipode_coords
		antipode_svc_data[:data][:attributes]
	end

	def format_lat_lng
		antipode_coords[:lat].round(4).to_s + "," + antipode_coords[:long].round(4).to_s
	end

	def darksky_service
		DarkskyApiService.new
	end

	def forecast_data
		darksky_service.forecast_data(format_lat_lng)
	end

	def current_weather
		Forecast.new(forecast_data)
	end

	def forecast
		hash = {}
		hash[:summary] = current_weather.daily_summary
		hash[:current_temp] = current_weather.temp
		hash
	end

	def antipode_city_data
		google_service.city_data(format_lat_lng)
	end

	def city_name
		data = antipode_city_data[:results][0][:address_components]
		data[2][:long_name] + ", " + data[3][:long_name]
	end
end