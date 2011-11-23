class CreateChoreLists < ActiveRecord::Migration
  def change
    create_table :chore_lists do |t|
      t.date :date
      t.string :note
      t.integer :user_id

      t.timestamps
    end
  end
end
