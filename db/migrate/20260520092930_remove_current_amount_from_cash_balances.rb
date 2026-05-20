class RemoveCurrentAmountFromCashBalances < ActiveRecord::Migration[8.1]
  def change
    remove_column :cash_balances, :current_amount, :float
  end
end
