class CreateChoreListsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :chore_lists_users, :id => false do |t|
      t.integer :chore_list_id
      t.integer :user_id
    end
  end
end
