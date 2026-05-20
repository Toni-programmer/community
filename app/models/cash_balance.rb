class CashBalance < ApplicationRecord
  belongs_to :community
  validates :community, presence: true
  validates :financial_year, presence: true, numericality: { only_integer: true, greater_than: 2000 }
  has_many :receipts, dependent: :destroy
  has_many :expenses, dependent: :destroy

  def community_name
    self.community.name+" - "+self.community.address
  end

 def current_amount
   receipts.sum(:monthly_price) - expenses.sum(:amount)
 end



 

  enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }, default: :pending

  def self.ransackable_attributes(auth_object = nil)
    [
      "community_id",
      "created_at",
      "financial_year",
      "id",
      "status",
      "updated_at"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["community", "receipts"]
  end


end
