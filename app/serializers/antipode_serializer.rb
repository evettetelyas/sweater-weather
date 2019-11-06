class AntipodeSerializer
	include FastJsonapi::ObjectSerializer
	
	attributes :id

	attribute :location_name, &:city_name

	attribute :forecast, &:forecast

	attribute :search_location, &:location

  end