class Api::V1::RoadTripsController < ApplicationController
	def create
		data = JSON.parse(request.body.read)
		user = User.find_by(api_key: data["api_key"])
		if user
			response = RoadTripsFacade.new(JSON.parse(request.body.read))
			render json: RoadTripSerializer.new(response), status: :ok
		else
			render json: {message: 'invalid key'}, status: :unauthorized
		end
	end
end