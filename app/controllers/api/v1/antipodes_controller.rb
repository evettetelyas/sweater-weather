class Api::V1::AntipodesController < ApplicationController
	def show
		antipode = AntipodeFacade.new(params[:location])
		render json: AntipodeSerializer.new(antipode), status: :ok
	rescue
		render json: {message: 'No Antipode'}, status: :bad_request
	end
end