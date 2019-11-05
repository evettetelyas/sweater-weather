class RoadTripsFacade
	include FacadeHelper
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

	# def to_epoch
	# 	calculate_hrs.hours.from_now.to_i
	# end

	def get_destination_forecast
		response = conn.get
		JSON.parse(response.body, symbolize_names: true)
	end

	def arrival_forecast
		hourlys = get_destination_forecast[:data][:attributes][:hourly_forecasts]
		hourlys[calculate_hrs]
	end

	private
	def conn
		Faraday.new(url: "http://localhost:3000/api/v1/forecast") do |f|
		  f.adapter  Faraday.default_adapter
		  f.params[:location] = @destination
		end
	end


end