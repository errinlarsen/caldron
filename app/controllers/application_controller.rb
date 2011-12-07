class ApplicationController < ActionController::Base
  before_filter :init_board


  private

  def init_board
    @board = Board.new
  end
end
