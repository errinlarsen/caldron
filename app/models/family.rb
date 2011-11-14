class Family < ActiveRecord::Base
  attr_accessible :name

  has_many :members, :class_name => "User"
  has_many :chore_lists

  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
end
