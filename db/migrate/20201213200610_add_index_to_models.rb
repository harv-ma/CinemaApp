class AddIndexToModels < ActiveRecord::Migration[5.2]
  def change
    add_index :showings, :id, unique: true
    add_index :showings, :film
    add_index :bookings, :user
  end
end
