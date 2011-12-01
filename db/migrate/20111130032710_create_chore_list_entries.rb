class CreateChoreListEntries < ActiveRecord::Migration
  def change
    create_table :chore_list_entries do |t|
      t.integer :chore_id
      t.integer :chore_list_id
      t.boolean :completed

      t.timestamps
    end
  end
end
