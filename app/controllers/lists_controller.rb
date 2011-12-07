class ListsController < ApplicationController
  def new
    @list = @board.new_list
  end

  def create
    @list = @board.new_list(params[:list])
    @list.post
    redirect_to root_path, :notice => "List created!"
  end
end
