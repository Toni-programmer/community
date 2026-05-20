class Receipt < ApplicationRecord
  belongs_to :property
  belongs_to :cash_balance

  validates :monthly_price, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true

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

  
   enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }
  
end
