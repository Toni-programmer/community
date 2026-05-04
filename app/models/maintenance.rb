class Maintenance < ApplicationRecord
  belongs_to :common_area
  belongs_to :supplier

  enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  }, default: :pending
end
