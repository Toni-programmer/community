class DashboardController < ApplicationController
  
 def index
   @cash_balances = CashBalance.includes(:community, :receipts, :expenses)

    @total_balance = CashBalance.all.sum(&:current_amount)
 end
end