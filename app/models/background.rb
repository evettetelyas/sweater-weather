class Background
	attr_reader :id, :image_url, :title
	
	def initialize(hash)
		@id = SecureRandom.hex(8)
		@image_url = hash[:url]
		@title = hash[:title]
	end
end