class ChoreList < ActiveRecord::Base
  attr_accessible :date, :note, :title

  belongs_to :user

  has_many :chore_list_entries, :dependent => :destroy
  has_many :chores, :through => :chore_list_entries

  validates_presence_of :date, :title
end
