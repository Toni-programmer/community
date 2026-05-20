class Notice < ApplicationRecord
  belongs_to :community

  validates :name, presence: true
  validates :concept, presence: true
end
