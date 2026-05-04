class CreateCashBalances < ActiveRecord::Migration[8.1]
  def change
    create_table :cash_balances do |t|
      t.references :community, null: false, foreign_key: true
      t.float :financial_year
      t.float :current_amount
      t.string :status

      t.timestamps
    end
  end
end
