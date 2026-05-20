class Expense < ApplicationRecord
  belongs_to :cash_balance
  belongs_to :supplier
  belongs_to :incidence

  validates :amount, presence: true, numericality: { greater_than: 0 }
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
  ["cash_balance", "property"]
   end

  def incidence_description
    description
  end

  enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }, default: :pending
end
