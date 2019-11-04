class Api::V1::UsersController < ApplicationController
	def create
		user = User.new(JSON.parse(request.body.read))
		if user.save
			user.update(api_key: SecureRandom.hex(16))
			data = {api_key: user.api_key}
			render json: data, status: :created
		else
			render json: {message: 'Could not create user'}, status: :bad_request
		end
	end
end