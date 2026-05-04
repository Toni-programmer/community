class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.references :cash_balance, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.references :incidence, null: false, foreign_key: true
      t.float :amount
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
