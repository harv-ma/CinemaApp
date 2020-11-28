class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :forename, :string
    add_column :users, :surname, :string
    add_column :users, :phonenumber, :string
  end
end
