class BackgroundSerializer
	include FastJsonapi::ObjectSerializer
	
	attributes :id, :image_url, :title

  end