class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.string :number
      t.string :payment_status
      t.boolean :late_payment
      t.integer :total_owners

      t.timestamps
    end
  end
end
