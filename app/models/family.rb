class Family < ActiveRecord::Base
  attr_accessible :name

  has_many :chore_lists
  has_and_belongs_to_many :members, :class_name => "User"

  validates_presence_of :name, :members
  validates_uniqueness_of :name, :case_sensitive => false
end
