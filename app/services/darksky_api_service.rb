class DarkskyApiService

	def forecast_data(lat_lng)
		data = conn.get(lat_lng)
		JSON.parse(data.body, symbolize_names: true)
	end

	private
	def conn
		Faraday.new(url: "https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/") do |f|
		  f.adapter  Faraday.default_adapter
		end
	end
end