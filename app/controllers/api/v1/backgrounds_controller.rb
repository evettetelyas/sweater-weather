class Api::V1::BackgroundsController < ApplicationController
	def show
		background = BackgroundsFacade.new(params[:location])
		render json: BackgroundSerializer.new(background)
	rescue
		render json: {message: 'No background'}, status: :bad_request
	end
end