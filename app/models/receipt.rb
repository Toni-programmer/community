class Receipt < ApplicationRecord
  belongs_to :property
  belongs_to :cash_balance

  after_create :sum_to_cash_balance

  private

  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "number",
      "community_id",
      "user_id",
      "total_owners",
      "payment_status",
      "late_payment",
      "created_at",
      "updated_at"
    ]
  end

 def self.ransackable_associations(auth_object = nil)
  [ "property"]
 end

   def self.total_balance
    sum(:monthly_price)
   end

  
 def sum_to_cash_balance
  return unless cash_balance && monthly_price

  cash_balance.update!(
    current_amount: cash_balance.current_amount.to_f + monthly_price.to_f
  )
 end
   enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }
  
end
