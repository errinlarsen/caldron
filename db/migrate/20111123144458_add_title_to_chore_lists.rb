class AddTitleToChoreLists < ActiveRecord::Migration
  def change
    add_column :chore_lists, :title, :String
  end
end
