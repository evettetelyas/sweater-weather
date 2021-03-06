class AntipodeService

	def antipode_data(lat, lng)
		data = conn.get('antipodes') do |req|
			req.params[:lat] = lat
			req.params[:long] = lng
		end
		JSON.parse(data.body, symbolize_names: true)
	end

	private
	def conn
		Faraday.new(url: "http://amypode.herokuapp.com/api/v1/") do |f|
		  f.adapter  Faraday.default_adapter
		  f.headers[:api_key] = ENV["ANTIPODE_API_KEY"]
		end
	end
end