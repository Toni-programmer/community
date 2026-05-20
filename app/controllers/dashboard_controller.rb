class DashboardController < ApplicationController

  def index
    @cash_balances = community_scope(CashBalance).includes(:community, :receipts, :expenses)
    @total_balance = @cash_balances.sum(&:current_amount)

    properties = community_scope(Property)
    total_props = properties.count
    @morosidad = total_props > 0 ? (properties.where(late_payment: true).count.to_f / total_props * 100).round(1) : 0

    @open_incidences_count = community_scope(Incidence).where(status: "Pendiente").count
    @recent_incidences = community_scope(Incidence).order(created_at: :desc).limit(5)

    current_year = Date.current.year
    date_range = Date.new(current_year, 1, 1)..Date.current

    cash_balance_ids = @cash_balances.map(&:id)
    receipts_by_month = Receipt
      .where(cash_balance_id: cash_balance_ids, date: date_range)
      .group("MONTH(date)")
      .sum(:monthly_price)

    expenses_by_month = Expense
      .where(cash_balance_id: cash_balance_ids, date: date_range)
      .group("MONTH(date)")
      .sum(:amount)

    @chart_labels = %w[Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic]
    @chart_receipts = (1..12).map { |m| receipts_by_month[m].to_f.round(2) }
    @chart_expenses = (1..12).map { |m| expenses_by_month[m].to_f.round(2) }
  end
end