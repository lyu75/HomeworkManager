class EditsToOh < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_hours, :day
    remove_column :office_hours, :star
    remove_column :office_hours, :end
    add_column :office_hours, :time, :string
  end
end
