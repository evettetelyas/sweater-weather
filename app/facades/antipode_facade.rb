class AntipodeFacade
	def initialize(location)
		@location = location
	end

	def get_coords
		GoogleService.new.intl_location_data(@location)
	end

	def lat_lng
		get_coords[:results][0][:geometry][:location]
	end

	def antipode_data
		binding.pry
		AntipodeService.new.antipode_data(lat_lng[:lat], lat_lng[:lng])
	end
end