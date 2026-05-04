class CreateMeetings < ActiveRecord::Migration[8.1]
  def change
    create_table :meetings do |t|
      t.references :community, null: false, foreign_key: true
      t.date :date
      t.string :type_meeting

      t.timestamps
    end
  end
end
