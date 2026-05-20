class Incidence < ApplicationRecord
  belongs_to :community
  belongs_to :user

  has_many :expenses, dependent: :destroy

  validates :description, presence: true
  validates :date, presence: true

  enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }

end
