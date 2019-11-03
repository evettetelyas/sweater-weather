class FlickrService

	def image_data(city, state, lat, lng)
		data = conn.get("rest") do |req|
			req.params[:tags] = "#{city},#{state},city"
			req.params[:tag_mode] = "all"
			req.params[:lat] = lat
			req.params[:lng] = lng
		end
		chars = data.body.chars
		chars.shift(14)
		chars.pop.last
		new_data = chars.join
		JSON.parse(new_data, symbolize_names: true)
	end

	private
	def conn
		Faraday.new(url: "https://api.flickr.com/services/") do |f|
		  f.adapter  Faraday.default_adapter
		  f.params[:api_key] = ENV["FLICKR_API_KEY"]
		  f.params[:method] = 'flickr.photos.search'
		  f.params[:format] = 'json'
		  f.params[:content_type] = 1
		  f.params[:geo_context] = 2
		  f.params[:radius_units] = 'mi'
		  f.params[:radius] = 10
		end
	end
end

# https://live.staticflickr.com/server/id_secret_n.jpg imageurl