module GoogleHelper
	def google_service
		GoogleService.new
	end

	def get_location_data
		location = @city + "+" + @state unless @location
		google_service.location_data(location)
	end

	def lat_lng
		get_location_data[:results][0][:geometry][:location]
	end

	def format_latlng(lat, lng)
		lat.round(4).to_s + "," + lng.round(4).to_s
	end
end