class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :common_area

  validates :date, presence: true

 enum :status,{
    pending: "Pendiente",
    completed: "Completado"
  },default: :completed



end

