class AddWeedToOhHours < ActiveRecord::Migration[5.2]
  def change
    add_column :office_hours, :day, :string
  end
end
