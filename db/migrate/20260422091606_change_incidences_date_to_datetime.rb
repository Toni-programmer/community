class ChangeIncidencesDateToDatetime < ActiveRecord::Migration[8.1]
  def change
    change_column :incidences,:date, :datetime
  end
end
