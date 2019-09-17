class RemoveOhLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_hours, :location
    add_column :courses, :oh_location, :string
  end
end
