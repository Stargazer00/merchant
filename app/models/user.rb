class User < ApplicationRecord
	has_many :orders
	has_many :addresses

	def self.find_or_create_by_auth(auth_data)
	  user = User.find_or_create_by(provider: auth_data['provider'], uid: auth_data['uid'])
	  user.name = auth_data['info']['name']
	  user.save
	  user
	end
end
