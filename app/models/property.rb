class Property < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :number, presence: true
  validates :total_owners, presence: true, numericality: { only_integer: true, greater_than: 0 }

  enum :payment_status,{
    afirmative: "Afirmativo",
    negative: "Negativo"
  }, default: :negative

   def user_name
    user.name
   end  

  def self.ransackable_attributes(auth_object = nil)
    ["community_id", "created_at", "id", "late_payment", "number", "payment_status", "total_owners", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

end
