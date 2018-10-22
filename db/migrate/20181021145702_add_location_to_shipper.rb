class AddLocationToShipper < ActiveRecord::Migration[5.1]
  def change
    add_column :shippers, :latitude, :float
    add_column :shippers, :longitude, :float
  end
end
