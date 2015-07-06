class Comment < ActiveRecord::Base
	belongs_to :post

	# SCOPES
	scope :active, -> { where(status: true) }
end
