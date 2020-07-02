class ChangeOriginToLocationInTransmissions < ActiveRecord::Migration[6.0]
  def change
    rename_column :transmissions, :origin_id, :location_id
  end
end
