class Post < ActiveRecord::Base
	# RELATIONSHIPS
	has_many :comments
	belongs_to :category

	# SCOPES
	scope :active, -> { where(status: true) }
	scope :inactive, -> { where(status: false) }

	# VALIDATIONS
	validates :title, :resume, :content, presence: true
	validates :title, length: { minimum: 10 }

	# UPLOADERS
	mount_uploader :image, ImageUploader
end