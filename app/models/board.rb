class Board
  attr_reader :lists
  attr_writer :list_maker

  def initialize
    @lists = []
  end

  def title
    "The Chore Board"
  end

  def subtitle
    "Letting other people know they need to get stuff done"
  end

  def new_list
    list_maker.call.tap do |new_list|
      new_list.board = self
    end
  end
  

  private
  def list_maker
    @list_maker ||= List.public_method(:new)
  end
end
