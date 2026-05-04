class CreateCommonAreas < ActiveRecord::Migration[8.1]
  def change
    create_table :common_areas do |t|
      t.references :community, null: false, foreign_key: true
      t.string :name
      t.string :area_type

      t.timestamps
    end
  end
end
