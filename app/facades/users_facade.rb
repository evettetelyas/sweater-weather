# class UsersFacade
# 	def initialize(hash)
# 		@email = hash[:email]
# 		@password = hash[:password]
# 		@password_confirmation = hash[:password_confirmation]
# 	end

# 	def user
# 		User.create(email: @email, password: @password, password_confirmation: @password_confirmation)
# 	end

# 	def api_key
# 		user.update(api_key: SecureRandom.hex(16))
# 		user.api_key
# 	end
end