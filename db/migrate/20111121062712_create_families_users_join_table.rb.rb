class CreateFamiliesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :families_users, :id => false do |t|
      t.integer :family_id
      t.integer :user_id
    end
  end
end
