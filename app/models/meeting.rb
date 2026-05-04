class Meeting < ApplicationRecord
  belongs_to :community

  enum :type_meeting,{
    ordinary: "Ordinaria",
    extraordinary: "Extraordinaria"
  }, default: :ordinary
end
