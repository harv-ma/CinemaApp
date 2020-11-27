class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title, uniqueness: true
      t.string :synopsis, null: false
      t.decimal :rating, null: false, default: 0
      t.decimal :duration, null: false, precision: 3, scale: 2
      t.string :Language, null: false
      t.date :Release_date, null: false

      t.timestamps
    end
  end
end