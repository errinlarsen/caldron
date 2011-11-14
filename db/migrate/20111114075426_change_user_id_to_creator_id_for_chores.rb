class ChangeUserIdToCreatorIdForChores < ActiveRecord::Migration
  def change
    change_table :chores do |t|
      t.rename :user_id, :creator_id
    end
  end
end
