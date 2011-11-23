class ChoreList < ActiveRecord::Base
  attr_accessible :date, :note

  belongs_to :user
end
