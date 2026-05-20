class Meeting < ApplicationRecord
  belongs_to :community

  validates :date, presence: true

  enum :type_meeting,{
    ordinary: "Ordinaria",
    extraordinary: "Extraordinaria"
  }, default: :ordinary
end
