class Role < ActiveRecord::Base

  # RELATIONSHIPS
  has_many :permissions
  has_many :users, :through => :permissions
end