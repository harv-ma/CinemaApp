class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :showing, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false
      t.integer :seatNumber, null: false

      t.timestamps
    end
  end
end
