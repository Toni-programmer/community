class CreateMaintenances < ActiveRecord::Migration[8.1]
  def change
    create_table :maintenances do |t|
      t.references :common_area, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
