class ForecastSerializer
	include FastJsonapi::ObjectSerializer
	# has_many :hourly_forecasts
	# has_many :daily_forecasts

	attribute :formatted_current_time do |object|
		date = DateTime.strptime(object.current_time.to_s,'%s')
		date.in_time_zone(object.timezone).strftime('%I:%M %p, %m/%d')
	end
	
	attributes :id, :current_summary, :timezone, :daily_summary, :high, :low, :icon, :temp, :feels_like, :humidity, :visibility, :uv_index, :hourly_forecasts, :daily_forecasts

  end