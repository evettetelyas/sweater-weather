class RoadTripsFacade
	include GoogleHelper
	include DarkstarHelper
	
	attr_reader :id, :arrival_forecast, :origin, :destination
	
	def initialize(data)
		@id = SecureRandom.hex(8)
		@origin = data["origin"]
		@destination = data["destination"].gsub(" ", ",")
	end

	def directions
		google_service.directions(@origin, @destination)
	end

	def distance_data
		time = directions[:routes][0][:legs][0][:duration][:text]
		splits = time.split(" ")
		hash = {}
		hash[:hour] = splits[0].to_i
		hash[:min] = splits[2].to_i
		hash
	end

	def calculate_hrs
		hrs = 0
		distance_data[:hour].times do
			hrs += 1
		end
		hrs += 1 if distance_data[:min] >= 30
		hrs
	end

	def get_destination_forecast
		data = Faraday.get "#{ENV["URL"]}/api/v1/forecast?location=#{@destination}"
		JSON.parse(data.body, symbolize_names: true)
	end

	def arrival_forecast
		hourlys = get_destination_forecast[:data][:attributes][:hourly_forecasts]
		hourlys[calculate_hrs]
	end
end