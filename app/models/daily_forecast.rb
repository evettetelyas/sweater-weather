class DailyForecast < ApplicationRecord
	# def initialize(data)
	# 	@day = DateTime.strptime(data[:time].to_s,'%s')
	# 	@summary = data[:summary]
	# 	@icon = data[:icon]
	# 	@precip_pct = data[:precipProbability]
	# 	@high = data[:temperatureHigh]
	# 	@low = data[:temperatureLow]
	# end
	belongs_to :forecast
end