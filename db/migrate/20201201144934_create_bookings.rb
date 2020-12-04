class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :showing, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true,  null: false

      t.timestamps
    end
  end
end
