class Background
	def initialize(hash)
		@id = SecureRandom.hex(8)
		@image_url = hash[:url]
		@title = hash[:title]
	end
end