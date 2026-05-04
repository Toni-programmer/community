class ChangeMeetingsDateToDatetime < ActiveRecord::Migration[8.1]
  def change
    change_column :meetings,:date, :datetime
  end
end
