class Post < ActiveRecord::Base
	# Relationships
	has_many :comments

	# Scopes
	scope :active, -> { where(status: true) }
	scope :inactive, -> { where(status: false) }

	# Validations
	validates :title, :resume, :content, presence: true
	validates :title, length: { minimum: 10 }
end