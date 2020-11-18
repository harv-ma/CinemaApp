class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :forename
      t.string :surname
      t.string :phonenumber

      t.timestamps
    end
  end
end
