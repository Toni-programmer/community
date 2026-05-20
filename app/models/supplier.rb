class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :cif, presence: true
end
