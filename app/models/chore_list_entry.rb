class ChoreListEntry < ActiveRecord::Base
  attr_accessible :completed, :notes

  belongs_to :chore_list
  belongs_to :chore

  validates_inclusion_of :completed, :in => [true, false]
end
