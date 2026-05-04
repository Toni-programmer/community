class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :phone, :string
    add_column :users, :role, :string
  end
end
