class ChangeReservationsDateToDatetime < ActiveRecord::Migration[8.1]
  def change
    change_column :reservations, :date, :datetime
  end
end
