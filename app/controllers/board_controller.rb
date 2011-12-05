class BoardController < ApplicationController
  def index
    @board = Board.new

    # Temporary - for testing
    today = Time.zone.today
    list1 = @board.new_list

    list1.date = today
    list1.chores << "Clean your room"
    list1.post

    list2 = @board.new_list(:date => today + 1.day)
    list2.chores += ["Clean your room", "Feed the dogs", "Wash the car"]
    list2.post
  end
end
