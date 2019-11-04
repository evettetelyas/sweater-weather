class AntipodeSerializer
	include FastJsonapi::ObjectSerializer
	
	attributes :id

	attribute :location_name do |obj|
		obj.city_name
	end

	attribute :forecast do |obj|
		obj.forecast
	end

	attribute :search_location do |obj|
		obj.location
	end

  end