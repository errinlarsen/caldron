class BoardController < ApplicationController
  def index
    @board = Board.new

    # Temporary - for testing
    today = Time.zone.today
    list1 = @board.new_list

    list1.date = today
    list1.title = "Some chore for today"
    chore1 = list1.new_chore
    chore1.name = "Clean your room"
    chore1.write
    list1.post
    puts list1.inspect

    list2 = @board.new_list(:date => today + 1.day,
                            :title => "Tomorrow's chores")
    chores2 = ["Clean your room", "Feed the dogs", "Wash the car"]
    chores2.each do |name|
      chore = list2.new_chore(:name => name)
      chore.write
    end
    list2.post
  end
end
