class User < ApplicationRecord
	has_secure_password

	# def api_key
	# 	self.update(api_key: SecureRandom.hex(16))
	# 	self.api_key
	# end
end
