class ListsController < ApplicationController
  def new
    @list = @board.new_list
  end

  def create
    d = Date.new *params[:list].sort.first(3).map(&:last).map(&:to_i)
    params[:list].reject! { |key, val| key =~ /^date/ }
    params[:list][:date] = d
    @list = @board.new_list(params[:list])
    @list.post
    redirect_to root_path, :notice => "List created!"
  end
end
