class ChangeCreatorIdToUserIdForChores < ActiveRecord::Migration
  def change
    change_table :chores do |t|
      t.rename :creator_id, :user_id
    end
  end
end
