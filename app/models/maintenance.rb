class Maintenance < ApplicationRecord
  belongs_to :common_area
  belongs_to :supplier

  validates :description, presence: true

  enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }, default: :pending
end
