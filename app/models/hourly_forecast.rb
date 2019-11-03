class HourlyForecast
	attr_reader :id, :temp, :time, :timezone

	def initialize(data, timezone)
		@id = SecureRandom.hex(8)
		@temp = data[:temperature]
		@time = data[:time]
		@timezone = timezone
		@formatted_time = format_hour
	end

	def format_hour
		hour = DateTime.strptime(@time.to_s,'%s')
		hour.in_time_zone(@timezone).strftime('%l %p')
	end

end