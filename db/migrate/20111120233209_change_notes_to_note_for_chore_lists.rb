class ChangeNotesToNoteForChoreLists < ActiveRecord::Migration
  def change
    change_table :chore_lists do |t|
      t.rename :notes, :note
    end
  end
end
