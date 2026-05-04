class CreateNotices < ActiveRecord::Migration[8.1]
  def change
    create_table :notices do |t|
      t.references :community, null: false, foreign_key: true
      t.string :name
      t.text :concept

      t.timestamps
    end
  end
end
