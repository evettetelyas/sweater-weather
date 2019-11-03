class PoroDailyForecast
	attr_reader :id, :day, :summary, :icon, :precip_pct, :high, :low

	def initialize(data)
		@id = SecureRandom.hex(8)
		@day = data[:time]
		@formatted_day = format_date
		@summary = data[:summary]
		@icon = data[:icon]
		@precip_pct = data[:precipProbability]
		@high = data[:temperatureHigh]
		@low = data[:temperatureLow]
	end

	def format_date
		day = DateTime.strptime(@day.to_s,'%s')
		day.strftime('%A')
	end

end