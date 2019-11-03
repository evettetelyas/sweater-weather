class ForecastSerializer
	include FastJsonapi::ObjectSerializer
	
	attributes :id, :current_summary, :current_time, :daily_summary, :high, :low, :icon, :temp, :feels_like, :humidity, :visibility, :uv_index, :hourly_forecasts, :daily_forecasts

  end