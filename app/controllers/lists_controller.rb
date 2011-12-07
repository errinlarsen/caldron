class ListsController < ApplicationController
  def new
    @list = @board.new_list
  end
end
