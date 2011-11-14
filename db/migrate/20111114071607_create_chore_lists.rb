class CreateChoreLists < ActiveRecord::Migration
  def change
    create_table :chore_lists do |t|
      t.date :date
      t.string :notes
      t.integer :family_id
      t.integer :user_id

      t.timestamps
    end
  end
end
