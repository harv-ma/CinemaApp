class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :seatNumber, null: false
      t.belongs_to :booking, foreign_key: true, null: false
      t.belongs_to :showing, foreign_key: true, null: false
      t.integer :row, null: false
      t.integer :col, null: false

      t.timestamps
    end
  end
end
