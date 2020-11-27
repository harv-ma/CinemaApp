class CreateShowings < ActiveRecord::Migration[5.2]
  def change
    create_table :showings do |t|
      t.datetime :startTime, null: false
      t.belongs_to :film, foreign_key: true, null: false
      t.belongs_to :room, foreign_key: true, null: false

      t.timestamps
    end
  end
end
