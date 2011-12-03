class ChoreListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @chore_lists = current_user.get_chore_lists_by_date
    @new_chore_list = ChoreList.new
  end

  def show
    @chore_list = ChoreList.find(params[:id])
    @entries = @chore_list.chore_list_entries
    @new_chore = Chore.new
  end

  def create
    @new_chore_list = current_user.chore_lists.build(params[:chore_list])
    @new_chore_list.date = Time.zone.today

    if @new_chore_list.save
      flash[:notice] = "New chore list was successfully created."
      redirect_to chore_lists_path
    else
      flash.now[:alert] = "The new chore list could not be created."
      @chore_lists = current_user.get_chore_lists_by_date
      render :index
    end
  end

  def create_chore
    @chore_list = ChoreList.find(params[:id])
    @new_chore = @chore_list.chores.build(params[:chore_list][:chores])
    @new_chore.chore_lists << @chore_list

    if @new_chore.save
      flash[:notice] = "New chore was successfully created."
      redirect_to chore_list_path(@chore_list)
    else
      flash.now[:alert] = "The new chore could not be created."
      @entries = @chore_list.chore_list_entries
      render :show
    end
  end

  def destroy
    @chore_list = ChoreList.find(params[:id])
    @chore_list.destroy
    flash[:notice] = "Successfully removed chore list."
    redirect_to chore_lists_path
  end
end
