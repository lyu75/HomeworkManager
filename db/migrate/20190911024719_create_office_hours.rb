class CreateOfficeHours < ActiveRecord::Migration[5.2]
  def change
    create_table :office_hours do |t|
      t.references :course, foreign_key: true
      t.string :day
      t.time :star
      t.time :end

      t.timestamps
    end
  end
end
