class AntipodeFacade
	include FacadeHelper
	
	attr_reader :id, :city_name, :current_weather, :location

	def initialize(location)
		@location = location
		@id = SecureRandom.hex(8)
	end

	def get_location_data
		google_service.location_data(@location)
	end

	def antipode_svc_data
		AntipodeService.new.antipode_data(lat_lng[:lat], lat_lng[:lng])
	end

	def antipode_coords
		antipode_svc_data[:data][:attributes]
	end

	def current_weather
		Forecast.new(forecast_data(antipode_coords[:lat], antipode_coords[:long]))
	end

	def forecast
		hash = {}
		hash[:summary] = current_weather.daily_summary
		hash[:current_temp] = current_weather.temp
		hash
	end

	def antipode_city_data
		google_service.city_data(format_latlng(antipode_coords[:lat], antipode_coords[:long]))
	end

	def city_name
		data = antipode_city_data[:results][0][:address_components]
		data[2][:long_name] + ", " + data[3][:long_name]
	end
end