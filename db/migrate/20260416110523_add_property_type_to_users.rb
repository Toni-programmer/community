class AddPropertyTypeToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :property_type, :integer
  end
end
