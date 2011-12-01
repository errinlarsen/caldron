class ChoreListEntry < ActiveRecord::Base
  attr_accessible :completed

  belongs_to :chore
  belongs_to :chore_list

  def completed?
    !!completed
  end
end
