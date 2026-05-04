class DashboardController < ApplicationController
  
 def index
  @cash_balances = CashBalance.includes(:community, :receipts)

  @total_balance = CashBalance.joins(:receipts).sum(:monthly_price)
 end
end