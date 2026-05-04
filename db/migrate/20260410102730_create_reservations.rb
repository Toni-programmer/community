class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :common_area, null: false, foreign_key: true
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
