class ChoreList < ActiveRecord::Base
  attr_accessible :date, :notes

  belongs_to :family
  belongs_to :User
  has_many :chore_list_entries
  has_many :chores, :through => :chore_list_entries
  has_and_belongs_to_many :workers, :class_name => "User"

  validates_presence_of :date
end
