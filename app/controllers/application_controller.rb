class ApplicationController < ActionController::Base
  before_filter :init_board


  private

  def init_board
    @board = THE_BOARD
  end
end
