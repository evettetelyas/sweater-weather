class RoadTripSerializer
	include FastJsonapi::ObjectSerializer
	
	attributes :id, :arrival_forecast, :origin, :destination

	attribute :approx_hours_to_destination, &:calculate_hrs

  end