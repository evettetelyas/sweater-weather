class Api::V1::ForecastsController < ApplicationController
	def show
		forecast = ForecastFacade.new(params[:location]).create_forecast
		render json: ForecastSerializer.new(forecast)
	rescue
		render json: {message: 'No forecast'}, status: :bad_request
	end
end