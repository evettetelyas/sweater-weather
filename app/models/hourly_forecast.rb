class HourlyForecast < ApplicationRecord
	# def initialize(data)
	# 	@time = DateTime.strptime(data[:time].to_s,'%s')
	# 	@temp = data[:temperature]
	# end
	belongs_to :forecast
end