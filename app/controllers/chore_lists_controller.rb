class ChoreListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @chore_lists = current_user.chore_lists.all
  end
end
