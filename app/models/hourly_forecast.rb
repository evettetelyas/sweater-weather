class HourlyForecast < ApplicationRecord
	# def initialize(data)
	# 	@time = DateTime.strptime(data[:time].to_s,'%s')
	# 	@temp = data[:temperature]
	# end
	belongs_to :forecast

	def formatted_time
		date = DateTime.strptime(self.time.to_s,'%s')
		date.getlocal.strftime('%I')
	end
end