class Page < ActiveRecord::Base

	# validates_presence_of :title
	validates :title, :content, presence: true
end
