class Forecast < ApplicationRecord

	has_many :hourly_forecasts
	has_many :daily_forecasts
end