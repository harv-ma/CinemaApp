class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :numberOfSeats, null: false
      t.boolean :WheelChair_Access, null:false
      t.string :format, default: 'A'
    end
  end
end
