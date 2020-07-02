class AddExposureToVisits < ActiveRecord::Migration[6.0]
  def change
    add_column :visits, :exposure, :boolean
  end
end
