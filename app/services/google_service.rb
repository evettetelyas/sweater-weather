class GoogleService

	def location_data(city, state)
		data = conn.get("json") do |req|
			req.params[:address] = city + "+" + state
		end
		JSON.parse(data.body, symbolize_names: true)
	end

	private
	def conn
		Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/") do |f|
		  f.adapter  Faraday.default_adapter
		  f.params[:key] = ENV["GOOGLE_API_KEY"]
		end
	end
	
end