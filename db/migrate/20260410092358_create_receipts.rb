class CreateReceipts < ActiveRecord::Migration[8.1]
  def change
    create_table :receipts do |t|
      t.references :property, null: false, foreign_key: true
      t.references :cash_balance, null: false, foreign_key: true
      t.date :date
      t.float :monthly_price
      t.string :status

      t.timestamps
    end
  end
end
