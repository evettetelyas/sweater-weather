class Forecast
	attr_reader :id, :current_summary, :current_time, :daily_summary, :high, :low, :icon, :temp, :feels_like, :humidity, :visibility, :uv_index, :timezone, :daily_forecasts, :hourly_forecasts

	def initialize(data)
		@id = SecureRandom.hex(8)
		@current_summary = data[:currently][:summary]
		@current_time = data[:currently][:time]
		@daily_summary = data[:daily][:data][0][:summary]
		@high = data[:daily][:data][0][:temperatureHigh]
		@low = data[:daily][:data][0][:temperatureLow]
		@icon = data[:currently][:icon]
		@temp = data[:currently][:temperature]
		@feels_like = data[:currently][:apparentTemperature]
		@humidity = data[:currently][:humidity]
		@visibility = data[:currently][:visibility]
		@uv_index = data[:currently][:uvIndex]
		@timezone = data[:timezone]
		@daily_forecasts = []
		@hourly_forecasts = []
	end

	def create_hourly(data, timezone)
		data[0..7].map do |data|
			hourly = HourlyForecast.new(data, timezone)
			@hourly_forecasts.push(hourly)
		end
	end

	def create_daily(data)
		data[0..4].map do |data| 
			daily = DailyForecast.new(data)
			@daily_forecasts.push(daily)
		end
	end
end