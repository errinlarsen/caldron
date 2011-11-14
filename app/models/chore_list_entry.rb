class ChoreListEntry < ActiveRecord::Base
  attr_accessible :completed, :notes

  belongs_to :chore_list
  belongs_to :user

  validates_presence_of :completed
end
