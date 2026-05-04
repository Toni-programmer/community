class Incidence < ApplicationRecord
  belongs_to :community
  belongs_to :user
  
  has_many :expenses, dependent: :destroy
  
  enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }

end
