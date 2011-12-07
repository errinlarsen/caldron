class ListsController < ApplicationController
  def new
    @list = @board.new_list
  end

  def create
    calendar = strip_date!(params)
    @list = @board.new_list(params[:list])
    @list.post(calendar)

    redirect_to root_path, :notice => "List created!"
  end

  
  private

  def strip_date!(params)
    # This generates params for Date.new like: [yyyy, mm, dd]
    date = Date.new(*params[:list].sort.first(3).map(&:last).map(&:to_i))
    # This strips the date keys because we parsed them above
    params[:list].reject! { |key, val| key =~ /^date/ }

    return OpenStruct.new(:today => date)
  end
end
