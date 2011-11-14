class CreateChoreListEntries < ActiveRecord::Migration
  def change
    create_table :chore_list_entries do |t|
      t.boolean :completed
      t.string :notes
      t.integer :chore_list_id
      t.integer :chore_id

      t.timestamps
    end
  end
end
