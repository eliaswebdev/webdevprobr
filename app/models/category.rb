class Category < ActiveRecord::Base
	# RELATIONSHIPS
	has_many :posts
end
