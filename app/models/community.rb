class Community < ApplicationRecord
  has_many :common_areas, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :incidences, dependent: :destroy
  has_many :reservations, through: :common_areas
  has_many :maintenances, through: :common_areas
  has_many :cash_balances, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :receipts, through: :properties

  validates :name, presence: true
  validates :address, presence: true
  validates :cif, presence: true
end