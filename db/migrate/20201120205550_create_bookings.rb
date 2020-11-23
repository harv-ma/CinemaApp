class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :showing, foreign_key: true
      t.belongs_to :customer, foreign_key: true
      t.integer :seatNumber

      t.timestamps
    end
  end
end
