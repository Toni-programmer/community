class CommonArea < ApplicationRecord
  belongs_to :community

  has_many :reservations, dependent: :destroy
  has_many :maintenances, dependent: :destroy

  enum :area_type, {
    pool: "Piscina",
    club_social: "Club",
    padel: "Padel",
    garage: "Garaje",
    sports_courts: "Pistas deportivas"
  }, default: :pool
  
  validates :name, presence: true
  validates :community_id, presence: true
end