class Api::V1::UsersController < ApplicationController
	def create
		user = User.new(JSON.parse(request.body.read))
		if user.save
			user.update(api_key: SecureRandom.hex(16))
			render json: {status: 201, api_key: user.api_key}
		else
			render json: {status: 500, message: 'something went wrong'}
		end
	end
end