class AddLatitudeAndLongitudeToSites < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :latitude, :float
    add_column :sites, :longitude, :float
  end
end
