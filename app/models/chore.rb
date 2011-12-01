class Chore < ActiveRecord::Base
  attr_accessible :name

  has_many :chore_list_entries
  has_many :chore_lists, :through => :chore_list_entries

  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
end
