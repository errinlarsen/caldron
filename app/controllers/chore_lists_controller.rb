class ChoreListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @chore_lists = current_user.chore_lists_by_date
    @new_chore_list = ChoreList.new
  end

  def create
    @new_chore_list = current_user.chore_lists.build(params[:chore_list])
    @new_chore_list.date = Time.zone.today
    if @new_chore_list.save
      flash[:notice] = "New chore list was successfully created."
      redirect_to chore_lists_path
    else
      flash.now[:alert] = "The new chore list could not be created."
      @chore_lists = current_user.chore_lists_by_date
      render :index
    end
  end
end
