class CreateShowings < ActiveRecord::Migration[5.2]
  def change
    create_table :showings do |t|
      t.date :startTime
      t.date :finishTime
      t.belongs_to :film, foreign_key: true
      t.belongs_to :room, foreign_key: true

      t.timestamps
    end
  end
end
