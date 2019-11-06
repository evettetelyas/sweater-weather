class BackgroundSerializer
	include FastJsonapi::ObjectSerializer
	
	attributes :id, :title

	attribute :image_url, &:single_image_url

  end