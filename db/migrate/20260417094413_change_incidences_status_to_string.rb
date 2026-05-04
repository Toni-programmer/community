class ChangeIncidencesStatusToString < ActiveRecord::Migration[8.1]
  def change
    change_column :incidences, :status, :string
  end
end
