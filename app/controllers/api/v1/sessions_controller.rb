class Api::V1::SessionsController < ApplicationController
	def create
		email = JSON.parse(request.body.read)["email"]
		password = JSON.parse(request.body.read)["password"]
		user = User.find_by(email: email)
		if user.authenticate(password)
			data = {api_key: user.api_key}
			render json: data, status: :created
		else
			render json: {message: 'Could not log in'}, status: :bad_request
		end
	end
end