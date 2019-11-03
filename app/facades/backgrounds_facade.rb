class BackgroundsFacade
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

	def flickr_service
		FlickrService.new
	end

	def get_image_data
		images = flickr_service.image_data(@city, @state, lat_lng[:lat], lat_lng[:lng])
		images[:photos][:photo].first
	end
	
	def single_image_url
		id = get_image_data[:id]
		server = get_image_data[:server]
		secret = get_image_data[:secret]
		"https://live.staticflickr.com/#{server}/#{id}_#{secret}_n.jpg"
	end

	def image
		hash = get_image_data
		hash[:url] = single_image_url
		Background.new(hash)
	end

end