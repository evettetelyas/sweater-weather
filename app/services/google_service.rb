class GoogleService

	def location_data(city, state)
		data = conn.get("geocode/json") do |req|
			req.params[:address] = city + "+" + state
		end
		JSON.parse(data.body, symbolize_names: true)
	end

	def intl_location_data(location)
		data = conn.get("geocode/json") do |req|
			req.params[:address] = location
		end
		JSON.parse(data.body, symbolize_names: true)
	end

	def city_data(lat_lng)
		data = conn.get("geocode/json") do |req|
			req.params[:latlng] = lat_lng
		end
		JSON.parse(data.body, symbolize_names: true)
	end

	def directions(origin, destination)
		data = conn.get("directions/json") do |req|
      		req.params[:origin] = origin
      		req.params[:destination] = destination
		end
		JSON.parse(data.body, symbolize_names: true)
	end

	private
	def conn
		Faraday.new(url: "https://maps.googleapis.com/maps/api/") do |f|
		  f.adapter  Faraday.default_adapter
		  f.params[:key] = ENV["GOOGLE_API_KEY"]
		end
	end
	
end