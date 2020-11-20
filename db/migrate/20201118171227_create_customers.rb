class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :phonenumber, null: false
      t.string :email, uniqueness: true
      t.string :password, null: false


      t.timestamps
    end
  end
end
