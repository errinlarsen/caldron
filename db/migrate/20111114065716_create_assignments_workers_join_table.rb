class CreateAssignmentsWorkersJoinTable < ActiveRecord::Migration
  def change
    create_table :assignments_workers, :id => false do |t|
      t.integer :chore_list_id
      t.integer :user_id
    end
  end
end
