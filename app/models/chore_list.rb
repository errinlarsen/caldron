class ChoreList < ActiveRecord::Base
  attr_accessible :date, :note, :title

  belongs_to :user

  validates_presence_of :date, :title
end
