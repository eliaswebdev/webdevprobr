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
	validates :title, uniqueness: true

	# UPLOADERS
	mount_uploader :image, ImageUploader

	# def to_param
	# 	"#{id} #{title}".parameterize+'.jsp'
	# end

	# CALLBACKS
	before_create :create_slug
	before_update :update_slug

	private
		def create_slug
			self.slug = self.title.parameterize
		end

		def update_slug
			self.slug = self.title.parameterize if self.slug.blank?

			if self.title_changed?
				self.slug = self.title.parameterize
			end			
		end

end