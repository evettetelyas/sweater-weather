class BackgroundsFacade
	include GoogleHelper
	include DarkstarHelper
	
	attr_reader :id, :title, :single_image_url

	def initialize(location)
		@city = location.split(",")[0]
		@state = location.split(",")[1]
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

	def title
		get_image_data[:title]
	end

	def id
		SecureRandom.hex(8)
	end

end