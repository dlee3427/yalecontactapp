class RemoveResultFromTests < ActiveRecord::Migration[6.0]
  def change
    remove_column :tests, :result, :boolean
  end
end
