class AddLocationToOfficehours < ActiveRecord::Migration[5.2]
  def change
    add_column :office_hours, :location, :string
  end
end
