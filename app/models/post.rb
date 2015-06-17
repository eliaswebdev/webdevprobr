class Post < ActiveRecord::Base
	# Relationships
	has_many :comments

	# Scopes
	scope :active, -> { where(status: true) }
	scope :inactive, -> { where(status: false) }

end